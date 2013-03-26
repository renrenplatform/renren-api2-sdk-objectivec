//
//  AlbumService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "AlbumService.h"
#import "RennRequest.h"
#import "RennExecutor.h"

@implementation AlbumService

-(NSString *) getAlbumByAlbumId:(NSNumber *) albumId OwnerId:(NSNumber *) ownerId error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:albumId, @"albumId", ownerId, @"ownerId",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/album/get" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) putAlbumWithLocation:(NSString *) location Description:(NSString *) description Name:(NSString *) name AccessControl:(NSString *) accessControl Password:(NSString *) password error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:location, @"location", description, @"description", name, @"name", accessControl, @"accessControl", password, @"password",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/album/put" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) listAlbumByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:ownerId, @"ownerId", pageSize, @"pageSize", pageNumber, @"pageNumber",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/album/list" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
