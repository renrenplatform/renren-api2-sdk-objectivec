//
//  BlogService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "BlogService.h"
#import "RennRequest.h"
#import "RennExecutor.h"

@implementation BlogService

-(NSString *) listBlogByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:ownerId, @"ownerId", pageSize, @"pageSize", pageNumber, @"pageNumber",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/blog/list" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) putBlogWithTitle:(NSString *) title AccessControl:(NSString *) accessControl Password:(NSString *) password Content:(NSString *) content error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:title, @"title", accessControl, @"accessControl", password, @"password",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = [NSDictionary dictionaryWithObjectsAndKeys:content, @"content",  nil ];
    RennRequest *request = [RennRequest requestWithPath:@"/v2/blog/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) getBlogByOwnerId:(NSNumber *) ownerId BlogId:(NSNumber *) blogId Password:(NSString *) password error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:ownerId, @"ownerId", blogId, @"blogId", password, @"password",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/blog/get" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
