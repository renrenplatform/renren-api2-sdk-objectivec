//
//  BaseService.h
//  renren-api2-sdk
//
//  Created by 杨 飞 on 13-3-20.
//  Copyright (c) 2013年 RenRen. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RennExecutor;
@class AccessToken;

@interface BaseService : NSObject
{
    RennExecutor * _executor;
    AccessToken * _token;
}

-(id)initWithAccessToken:(AccessToken *) token Executor:(RennExecutor *)executor;
@end
