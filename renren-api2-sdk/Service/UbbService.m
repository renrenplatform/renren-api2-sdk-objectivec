//
//  UbbService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "UbbService.h"
#import "RennRequest.h"
#import "RennExecutor.h"


@implementation UbbService

-(NSString *) listUbb:(NSError **) error;
{
    NSDictionary *textParams = nil;
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/ubb/list" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
