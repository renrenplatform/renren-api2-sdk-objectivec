//
//  FeedService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "FeedService.h"
#import "RennRequest.h"
#import "RennExecutor.h"

@implementation FeedService

-(NSString *) putFeedWithMessage:(NSString *) message Title:(NSString *) title ActionTargetUrl:(NSString *) actionTargetUrl ImageUrl:(NSString *) imageUrl Description:(NSString *) description Subtitle:(NSString *) subtitle ActionName:(NSString *) actionName TargetUrl:(NSString *) targetUrl error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:message, @"message", title, @"title", actionTargetUrl, @"actionTargetUrl", imageUrl, @"imageUrl", description, @"description", subtitle, @"subtitle", actionName, @"actionName", targetUrl, @"targetUrl",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/feed/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
