//
//  RennClient.h
//  renren-api2-sdk
//
//  Auto Generate on 13-3-19.
//  Copyright (c) 2013年 RenRen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceHeader.h"

@class AccessToken;
@class RennExecutor;

@interface RennClient : NSObject
{
    NSString * _clientId;
    NSString * _clientSecret;
    AccessToken * _accessToken;
    RennExecutor * _executor;
}

-(RennClient *) initWithClientId:(NSString *)clientId ClientSecret:(NSString *)clientSecret;

-(void) authorizeWithBearerToken:(NSString *)bearerToken;

-(void) authorizeWithAccessToken:(NSString *)macToken macKey:(NSString *)macKey macAlgorithm:(NSString *)macAlgorithm;

-(void) authorizeWithResourceOwnerUserName:(NSString *)username Password:(NSString *) pwd error:(NSError **)error;

-(void) authorizeWithClientCredentials:(NSError **)error;

@property (nonatomic,readonly) ShareService * shareService;
@property (nonatomic,readonly) StatusService * statusService;
@property (nonatomic,readonly) AlbumService * albumService;
@property (nonatomic,readonly) UbbService * ubbService;
@property (nonatomic,readonly) NotificationService * notificationService;
@property (nonatomic,readonly) FeedService * feedService;
@property (nonatomic,readonly) BlogService * blogService;
@property (nonatomic,readonly) PhotoService * photoService;
@property (nonatomic,readonly) UserService * userService;
@property (nonatomic,readonly) ProfileService * profileService;

@end
