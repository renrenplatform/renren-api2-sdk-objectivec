//
//  ShareService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "ShareService.h"
#import "RennRequest.h"
#import "RennExecutor.h"

@implementation ShareService

-(NSString *) putShareUgcWithUgcOwnerId:(NSNumber *) ugcOwnerId Comment:(NSString *) comment UgcId:(NSNumber *) ugcId UgcType:(NSString *) ugcType error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:ugcOwnerId, @"ugcOwnerId", comment, @"comment", ugcId, @"ugcId", ugcType, @"ugcType",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/share/ugc/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) putShareUrlWithComment:(NSString *) comment Url:(NSString *) url error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:comment, @"comment", url, @"url",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/share/url/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) getShareByShareId:(NSNumber *) shareId OwnerId:(NSNumber *) ownerId error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:shareId, @"shareId", ownerId, @"ownerId",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/share/get" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) listShareByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:ownerId, @"ownerId", pageSize, @"pageSize", pageNumber, @"pageNumber",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/share/list" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
