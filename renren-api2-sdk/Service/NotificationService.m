//
//  NotificationService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "NotificationService.h"
#import "RennRequest.h"
#import "RennExecutor.h"

@implementation NotificationService

-(NSString *) putNotificationUserWithContent:(NSString *) content UserIds:(NSArray *) userIds error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:content, @"content", [userIds componentsJoinedByString:@","], @"userIds",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/notification/user/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) putNotificationAppWithContent:(NSString *) content UserIds:(NSArray *) userIds error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:content, @"content", [userIds componentsJoinedByString:@","], @"userIds",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/notification/app/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
