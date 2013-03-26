//
//  PhotoService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface PhotoService : BaseService
/**
 * 上传照片至用户相册。此接口需要采用multipart/form-data的编码方式。
 * @param albumId 相册ID,albumId省略时会上传到应用相册 
 * @param description 照片描述 
 * @param file 照片
 * @return NSString * 照片
 */
-(NSString *) uploadPhotoWithAlbumId:(NSNumber *) albumId Description:(NSString *) description File:(NSData *) file error:(NSError **) error;

/**
 * 获取某个用户某个相册里的某张照片
 * @param albumId 相册的ID 
 * @param photoId 照片的ID 
 * @param ownerId 相册所有者的ID 
 * @param password 相册的密码 
 * @return NSString * 照片
 */
-(NSString *) getPhotoByAlbumId:(NSNumber *) albumId PhotoId:(NSNumber *) photoId OwnerId:(NSNumber *) ownerId Password:(NSString *) password error:(NSError **) error;

/**
 * 以分页的方式获取某个用户某个相册里的照片列表
 * @param albumId 相册的ID 
 * @param ownerId 相册所有者的ID 
 * @param pageSize 页面大小。取值范围1-100，默认大小20 
 * @param pageNumber 页码。取值大于零，默认值为1 
 * @param password 相册的密码， 
 * @return NSString * 照片
 */
-(NSString *) listPhotoByAlbumId:(NSNumber *) albumId OwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber Password:(NSString *) password error:(NSError **) error;

@end
