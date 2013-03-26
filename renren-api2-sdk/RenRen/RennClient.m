//
//  RennClient.m
//  renren-api2-sdk
//
//  Auto Generate on 13-3-19.
//  Copyright (c) 2013年 RenRen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "RennClient.h"
#import "AccessToken.h"
#import "RennExecutor.h"
#import "ServiceHeader.h"
#import "SBJSON.h"

#define KRennRequestTimeOutInterval 100
@implementation RennClient

@synthesize shareService = _shareService;
@synthesize statusService = _statusService;
@synthesize albumService = _albumService;
@synthesize ubbService = _ubbService;
@synthesize notificationService = _notificationService;
@synthesize feedService = _feedService;
@synthesize blogService = _blogService;
@synthesize photoService = _photoService;
@synthesize userService = _userService;
@synthesize profileService = _profileService;

-(RennClient *) initWithClientId:(NSString *)clientId ClientSecret:(NSString *)clientSecret
{
    if (self = [super init]) {
        _clientId = [clientId copy];
        _clientSecret = [clientSecret copy];
        _executor = [[RennExecutor alloc] init];
    }
    RMLog(@"编译时间%s",__TIME__);
    return self;
}

-(void)dealloc
{
    [_shareService release];
    [_statusService release];
    [_albumService release];
    [_ubbService release];
    [_notificationService release];
    [_feedService release];
    [_blogService release];
    [_photoService release];
    [_userService release];
    [_profileService release];
    [super dealloc];
}

-(void) authorizeWithResourceOwnerUserName:(NSString *)username Password:(NSString *) pwd error:(NSError **)error
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:_clientId forKey:@"client_id"];
    [params setObject:_clientSecret forKey:@"client_secret"];
    [params setObject:@"password" forKey:@"grant_type"];
    [params setObject:username forKey:@"username"];
    [params setObject:pwd forKey:@"password"];
    [params setObject:[AccessToken MAC] forKey:@"token_type"];
    [_accessToken release];
    _accessToken = nil;
    _accessToken = [[self requestAccessToken:params error:error] retain];
}

-(void) authorizeWithClientCredentials:(NSError **)error
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:_clientId forKey:@"client_id"];
    [params setObject:_clientSecret forKey:@"client_secret"];
    [params setObject:@"client_credentials" forKey:@"grant_type"];
    [params setObject:[AccessToken MAC] forKey:@"token_type"];
    
    [_accessToken release];
    _accessToken = nil;
    _accessToken = [[self requestAccessToken:params error:error] retain];
}

- (void) authorizeWithBearerToken:(NSString * )bearerToken
{
    [_accessToken release];
    _accessToken = nil;
    _accessToken = [[AccessToken alloc] init];
    _accessToken.type = Bearer;
    _accessToken.accessToken = bearerToken;
}

-(void)authorizeWithAccessToken:(NSString *)macToken macKey:(NSString *)macKey macAlgorithm:(NSString *)macAlgorithm
{
    [_accessToken release];
    _accessToken = nil;
    _accessToken = [[AccessToken alloc] init];
    _accessToken.type = MAC;
    _accessToken.accessToken = macToken;
    _accessToken.macKey = macKey;
    _accessToken.macAlgorithm = macAlgorithm;
}

-(void) authorizeWithAccessToken:(AccessToken *) token
{
    [_accessToken release];
    _accessToken = nil;
    _accessToken = [token retain];
}

- (AccessToken *) requestAccessToken:(NSDictionary *)params error:(NSError **)error
{
    NSString * requestUrl = @"https://graph.renren.com/oauth/token";
    ASIFormDataRequest * request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:requestUrl]];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    request.requestMethod = @"POST";
    request.responseEncoding = NSUTF8StringEncoding;
    
    NSArray *keys;
    int i, count;
    id key, value;
    
    keys = [params allKeys];
    count = [keys count];
    for (i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        value = [params objectForKey: key];
        [request addPostValue:value forKey:key];
    }
    [request setDelegate:self];
    [request startSynchronous];
    
    id result = [self parseJsonResponse:[request responseString] error:error];
    if ([result objectForKey:@"access_token"]) {
        AccessToken * token = [[[AccessToken alloc] init] autorelease];
        token.accessToken = [result objectForKey:@"access_token"];
        token.refreshToken = [result objectForKey:@"refresh_token"];
        token.macKey = [result objectForKey:@"mac_key"];
        token.macAlgorithm = [result objectForKey:@"mac_algorithm"];
        if ([[params objectForKey:@"token_type"] isEqual:@"MAC"]) {
            token.type = MAC;
        }
        else if([[params objectForKey:@"token_type"] isEqual:@"Bearer"])
        {
            token.type = Bearer;
        }
        return token;
    }
    return nil;
}

/**
 * 解析返回的data, 只有handleResponseData函数调用.
 */
- (id)parseJsonResponse:(NSString *)responseString error:(NSError **)error
{
    SBJSON *jsonParser = [[SBJSON new] autorelease];
    id result = [jsonParser objectWithString:responseString];
    NSRange range = [responseString rangeOfString:@"error"];
    if (range.location!=NSNotFound) {
        if (error) {
            *error = [NSError errorWithDomain:@"Renren SDK ERROR" code:0 userInfo:result];
        }
        return nil;
    }
    return result;
}

-(ShareService *) shareService
{
    if (!_shareService) {
        _shareService = [[ShareService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _shareService;
}
-(StatusService *) statusService
{
    if (!_statusService) {
        _statusService = [[StatusService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _statusService;
}
-(AlbumService *) albumService
{
    if (!_albumService) {
        _albumService = [[AlbumService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _albumService;
}
-(UbbService *) ubbService
{
    if (!_ubbService) {
        _ubbService = [[UbbService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _ubbService;
}
-(NotificationService *) notificationService
{
    if (!_notificationService) {
        _notificationService = [[NotificationService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _notificationService;
}
-(FeedService *) feedService
{
    if (!_feedService) {
        _feedService = [[FeedService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _feedService;
}
-(BlogService *) blogService
{
    if (!_blogService) {
        _blogService = [[BlogService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _blogService;
}
-(PhotoService *) photoService
{
    if (!_photoService) {
        _photoService = [[PhotoService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _photoService;
}
-(UserService *) userService
{
    if (!_userService) {
        _userService = [[UserService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _userService;
}
-(ProfileService *) profileService
{
    if (!_profileService) {
        _profileService = [[ProfileService alloc] initWithAccessToken:_accessToken Executor:_executor];
    }
    return _profileService;
}

@end
