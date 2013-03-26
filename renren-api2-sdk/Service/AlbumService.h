//
//  AlbumService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface AlbumService : BaseService
/**
 * 获取某个用户的某个相册
 * @param albumId 相册的ID 
 * @param ownerId 相册所有者的ID 
 * @return NSString * 相册
 */
-(NSString *) getAlbumByAlbumId:(NSNumber *) albumId OwnerId:(NSNumber *) ownerId error:(NSError **) error;

/**
 * 创建一个相册
 * @param location 相册拍摄的地点 
 * @param description 相册的描述 
 * @param name 相册的名字 
 * @param accessControl 相册的访问控制 
 * @param password 相册的访问密码,1-16个字符 
 * @return NSString * 相册
 */
-(NSString *) putAlbumWithLocation:(NSString *) location Description:(NSString *) description Name:(NSString *) name AccessControl:(NSString *) accessControl Password:(NSString *) password error:(NSError **) error;

/**
 * 以分页的方式获取某个用户的相册列表
 * @param ownerId 相册所有者的ID 
 * @param pageSize 页面大小。取值范围1-100，默认大小20 
 * @param pageNumber 页码。取值大于零，默认值为1 
 * @return NSString * 相册
 */
-(NSString *) listAlbumByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error;

@end
