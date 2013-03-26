//
//  RennRequest.m
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RennRequest.h"

#define API_SERVER     @"api.renren.com"
#define API_PORT    @"80"
//#define kRennRequestStringBoundary    @"00content0boundary00"
//#define kRennRequestTimeOutInterval 100


@implementation RennRequest

+ (RennRequest *) requestWithPath:(NSString *)path
                           method:(Method)method
                      accessToken:(AccessToken *) accessToken
                       textParams:(NSDictionary *)textParams
                       bodyParams:(NSDictionary *)bodyParams
                       fileParams:(NSDictionary *)fileParams
                            error:(NSError **)error
{
    RennRequest *request = [[[RennRequest alloc] init] autorelease];
    request.path = path;
    request.method = method;
    request.textParams = textParams;
    request.fileParams = fileParams;
    request.bodyParams = bodyParams;
    request.accessToken = accessToken;
    request.error = error;
    return request;
}

- (void)dealloc
{
    self.path = nil;
    self.accessToken = nil;
    self.fileParams = nil;
    self.textParams = nil;
    self.bodyParams = nil;
    [super dealloc];
}

@end
