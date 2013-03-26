//
//  OAuth2SignatureMethod.m
//  renren_sdk
//
//  Created by neuprince on 13-3-8.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
#include <stdlib.h>
#import "OAuth2SignatureMethod.h"

static NSString *CHAR_LIST =@"abcdefghigklmnopkrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";

@implementation OAuth2SignatureMethod


//用HmacSHA1进行加密
- (NSString *)sign:(NSString *)data secret:(NSString *)key {
    
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
//    NSString *hash = [HMAC base64EncodedString];
    NSString * hash = [self base64EncodedStringWithData:HMAC];
    [HMAC release];
    return hash;
}
//格式化需要加密的字段
-(NSString *) normalizeRequestByTimestamp:(NSString *)timeStamp nonce:(NSString*)nonce ext:(NSString*)ext httpMethod:(NSString*)httpMethod uri:(NSString*)uri host:(NSString*)host port:(NSString*)port
{
    NSMutableString * sb = [[[NSMutableString alloc]init]autorelease];
    //“1362398040”+“\n”+“hCsKV1wi”+“\n”+“GET”+“\n”+“v2/user/get?userId=431358208”+“\n”+“api.renren.com”+“80”+“\n”+ “a,b,c”+“\n”
    NSArray* arr =[NSArray arrayWithObjects:timeStamp, nonce, httpMethod, uri, host, port,ext,nil];
    for (int i=0;i<[arr count];i++) {
        [sb appendFormat:@"%@\n",([arr objectAtIndex:i]==nil?@"":[arr objectAtIndex:i])];
    }
    return sb;
}

-(NSString *) getRandomStringForLength:(int)length
{
    NSMutableString * rs = [NSMutableString stringWithCapacity:length];
    for (int i = 0; i < length; i++) {
        int number = arc4random() % 62;
        [rs appendFormat:@"%c",[CHAR_LIST characterAtIndex:number]];
    }
    return rs;
}

- (NSString *)base64EncodedStringWithData:(NSData *)data
{
	size_t outputLength;
	char *outputBuffer =
    NewBase64Encode([data bytes], [data length], true, &outputLength);
	NSString *result =
    [[[NSString alloc]
      initWithBytes:outputBuffer
      length:outputLength
      encoding:NSASCIIStringEncoding]
     autorelease];
	free(outputBuffer);
	return result;
}
@end