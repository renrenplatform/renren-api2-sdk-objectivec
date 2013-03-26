//
//  RennExecutor.m
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import "RennExecutor.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "RennLog.h"
#import "AccessToken.h"
#import "OAuth2SignatureMethod.h"

#define API_SERVER     @"api.renren.com"
#define API_PORT    @"80"

//NSString * URLEncodedString(NSString * string){
//
//    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                           (CFStringRef)string,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8);
//    [result autorelease];
//    return result;
//}

@implementation RennExecutor
-(RennResponse *) execute:(RennRequest*) request
{
    if (!request.accessToken) {
        if (request.error) {
            *request.error = [NSError errorWithDomain:@"No AccessToken" code:0 userInfo:nil];
        }
        return nil;
    }
    RennResponse * response = nil;
    switch (request.method) {
        case POST:
            response = [self postRuquest:request];
            break;
        case GET:
            response = [self getRuquest:request];
            break;
        default:
            break;
    }
    return response;
}

- (RennResponse *) getRuquest:(RennRequest*) request
{
    NSString * protocol = MAC==request.accessToken.type?@"http":@"https";
    NSMutableString * requestUrl = [NSMutableString stringWithFormat:@"%@://%@%@",protocol,API_SERVER,request.path];
    NSArray * keys = [request.textParams allKeys];
    int count = [keys count];
    for (int i = 0; i < count; i++)
    {
        id key = [keys objectAtIndex: i];
        id value = [request.textParams objectForKey: key];
        if (i == 0) {
            [requestUrl appendString:@"?"];
        }
        if (i > 0) {
            [requestUrl appendString:@"&"];
        }
        NSString * stringValue = [value description];
        [requestUrl appendFormat:@"%@=%@",
         [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
         [stringValue stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    ASIHTTPRequest * asiRequest = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:requestUrl]];
    [asiRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    asiRequest.responseEncoding = NSUTF8StringEncoding;
    NSString * authorization = [self getAuthorizationHeaderByUrl:requestUrl httpMethod:@"GET" Token:request.accessToken];
    RMLog(@"Authorization:%@",authorization);
    [asiRequest addRequestHeader:@"Authorization" value:authorization];
    [asiRequest setDelegate:self];
    [asiRequest startSynchronous];
    //错误信息无法顺利返回，code!=200
    //    NSError * error = nil;
    RMLog(@"requestUrl:%@",requestUrl);
    RennResponse * asiResponse = [[[RennResponse alloc] init] autorelease];
    asiResponse.responseCode = [asiRequest responseStatusCode];
    BOOL sucessed = [self parseJsonResponse:[asiRequest responseString] error:request.error];
    if (sucessed) {
        asiResponse.responseString = [asiRequest responseString];
    }
    RMLog(@"\ncode:%d\nresponseString:%@",[asiRequest responseStatusCode],[asiRequest responseString]);
    return asiResponse;
}

- (RennResponse *) postRuquest:(RennRequest*) request
{
    NSString * protocol = MAC==request.accessToken.type?@"http":@"https";
    NSMutableString * requestUrl = [NSMutableString stringWithFormat:@"%@://%@%@",protocol,API_SERVER,request.path];
    if (request.textParams && [request.textParams count] > 0) {
        NSArray * keys = [request.textParams allKeys];
        int count = [keys count];
        for (int i = 0; i < count; i++)
        {
            id key = [keys objectAtIndex: i];
            id value = [request.textParams objectForKey: key];
            if (i == 0) {
                [requestUrl appendString:@"?"];
            }
            if (i > 0) {
                [requestUrl appendString:@"&"];
            }
            NSString * stringValue = [value description];
            [requestUrl appendFormat:@"%@=%@",
             [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
             [stringValue stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    ASIFormDataRequest * asiRequest = [[[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:requestUrl]] autorelease];
    [asiRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    asiRequest.responseEncoding = NSUTF8StringEncoding;
    NSString * authorization = [self getAuthorizationHeaderByUrl:requestUrl httpMethod:@"POST" Token:request.accessToken];
    RMLog(@"Authorization:%@",authorization);
    [asiRequest addRequestHeader:@"Authorization" value:authorization];
    if (request.bodyParams && [request.bodyParams count] > 0) {
        NSArray * bodyKeys = [request.bodyParams allKeys];
        for (int i = 0; i < [bodyKeys count]; i++)
        {
            id key = [bodyKeys objectAtIndex: i];
            id value = [request.bodyParams objectForKey: key];
            if (value != nil) {
                [asiRequest addPostValue:value forKey:key];
            }
        }
    }
    if (request.fileParams && [request.fileParams count] > 0)
    {
        for (id key in request.fileParams)
        {
            NSObject *dataParam = [request.fileParams valueForKey:key];
            if ([dataParam isKindOfClass:[UIImage class]])
            {
                NSData* imageData = UIImagePNGRepresentation((UIImage *)dataParam);
                [asiRequest addData:imageData withFileName:@"file.png" andContentType:@"image/png" forKey:key];
            }
            else if ([dataParam isKindOfClass:[NSData class]])
            {
                NSData * data = (NSData *) dataParam;
                [asiRequest addData:data withFileName:@"file.png" andContentType:@"image/jpg" forKey:key];
            }
        }
    }
    [asiRequest setDelegate:self];
    [asiRequest startSynchronous];
    
    RMLog(@"requestUrl:%@",requestUrl);
    RennResponse * asiResponse = [[[RennResponse alloc] init] autorelease];
    asiResponse.responseCode = [asiRequest responseStatusCode];
    BOOL sucessed = [self parseJsonResponse:[asiRequest responseString] error:request.error];
    if (sucessed) {
        asiResponse.responseString = [asiRequest responseString];
    }
    RMLog(@"\ncode:%d\nresponseString:%@",[asiRequest responseStatusCode],[asiRequest responseString]);
    return asiResponse;
}

-(NSString *) getAuthorizationHeaderByUrl:(NSString *)url httpMethod:(NSString*)httpMethod Token:(AccessToken *) token
{
    NSMutableString * authorizationHeader = [[[NSMutableString alloc] init] autorelease];
    if (MAC == token.type) {
        long timeStamp = [[NSDate date] timeIntervalSince1970];
        OAuth2SignatureMethod * signMethod = [[[OAuth2SignatureMethod alloc]init]autorelease];
        NSString * nonce = [signMethod getRandomStringForLength:8];
        //从usrString中截取出path
        NSRange range = [url rangeOfString:API_SERVER];
        NSString * pathAndQuery = [url substringFromIndex:range.location + range.length];
        NSString * standString = [signMethod normalizeRequestByTimestamp:[NSString stringWithFormat:@"%ld",timeStamp] nonce:nonce ext:@"" httpMethod:httpMethod uri:pathAndQuery host:API_SERVER port:API_PORT];
        RMLog(@"待加密standString:%@",standString);
        NSString *mac = [signMethod sign:standString secret:[token macKey]];
        RMLog(@"mackey:%@ mac:%@",[token macKey],mac);
        [authorizationHeader appendFormat:@"MAC id=\"%@\",ts=\"%ld\",nonce=\"%@\",mac=\"%@\"",[token accessToken],
         timeStamp, nonce, mac];
    }
    else
    {
        [authorizationHeader appendFormat:@"Bearer %@",[token accessToken]];
    }
    return authorizationHeader;
}

//解析返回的json串，判断返回是否成功
- (BOOL) parseJsonResponse:(NSString *)responseString error:(NSError **)error
{
    SBJSON *jsonParser = [[SBJSON new] autorelease];
    id result = [jsonParser objectWithString:responseString];
    id errorInfo=[result objectForKey:@"error"];
    if (errorInfo != nil) {
        if (error) {
            *error = [NSError errorWithDomain:@"Renren SDK ERROR" code:0 userInfo:errorInfo];
        }
        return NO;
    }
    return YES;
}
@end
