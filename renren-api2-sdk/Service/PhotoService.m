//
//  PhotoService.m
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import "PhotoService.h"
#import "RennRequest.h"
#import "RennExecutor.h"

@implementation PhotoService

-(NSString *) uploadPhotoWithAlbumId:(NSNumber *) albumId Description:(NSString *) description File:(NSData *) file error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:albumId, @"albumId", description, @"description",  nil ];
    NSDictionary *fileParams = [NSDictionary dictionaryWithObjectsAndKeys:file, @"file",  nil ];
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/photo/upload" method:POST accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) getPhotoByAlbumId:(NSNumber *) albumId PhotoId:(NSNumber *) photoId OwnerId:(NSNumber *) ownerId Password:(NSString *) password error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:albumId, @"albumId", photoId, @"photoId", ownerId, @"ownerId", password, @"password",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/photo/get" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

-(NSString *) listPhotoByAlbumId:(NSNumber *) albumId OwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber Password:(NSString *) password error:(NSError **) error
{
    NSDictionary *textParams = [NSDictionary dictionaryWithObjectsAndKeys:albumId, @"albumId", ownerId, @"ownerId", pageSize, @"pageSize", pageNumber, @"pageNumber", password, @"password",  nil ];
    NSDictionary *fileParams = nil;
    NSDictionary *bodyParams = nil;
    RennRequest *request = [RennRequest requestWithPath:@"/v2/photo/list" method:GET accessToken:_token textParams:textParams bodyParams:bodyParams fileParams:fileParams error:error];
    RennResponse * response = [_executor execute:request];
    return response.responseString;
}

@end
