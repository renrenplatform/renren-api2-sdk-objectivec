//
//  BaseService.m
//  renren-api2-sdk
//
//  Created by 杨 飞 on 13-3-20.
//  Copyright (c) 2013年 RenRen. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

-(id)initWithAccessToken:(AccessToken *) token Executor:(RennExecutor *)executor
{
    if (self = [super init]) {
        _token = [token retain];
        _executor = [executor retain];
    }
    return self;
}

-(void) dealloc
{
    [_token release];
    [_executor release];
    [super dealloc];
}
@end
