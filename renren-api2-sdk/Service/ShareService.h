//
//  ShareService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface ShareService : BaseService
/**
 * 分享人人网内部UGC资源，例如：日志、照片、相册、分享(基于已有分享再次进行分享）
 * @param ugcOwnerId UGC所有者的用户ID 
 * @param comment 分享时用户的评论 
 * @param ugcId UGC的ID 
 * @param ugcType UGC的类型。 
 * @return NSString * 分享
 */
-(NSString *) putShareUgcWithUgcOwnerId:(NSNumber *) ugcOwnerId Comment:(NSString *) comment UgcId:(NSNumber *) ugcId UgcType:(NSString *) ugcType error:(NSError **) error;

/**
 * 分享人人网外部资源，例如：视频、URL，等
 * @param comment 分享时用户的评论 
 * @param url 分享资源的URL 
 * @return NSString * 分享
 */
-(NSString *) putShareUrlWithComment:(NSString *) comment Url:(NSString *) url error:(NSError **) error;

/**
 * 获取某个用户的某个分享
 * @param shareId 分享ID 
 * @param ownerId 分享所有者ID 
 * @return NSString * 分享
 */
-(NSString *) getShareByShareId:(NSNumber *) shareId OwnerId:(NSNumber *) ownerId error:(NSError **) error;

/**
 * 以分页的方式获取某个用户的分享列表
 * @param ownerId 分享所有者ID 
 * @param pageSize 页面大小。取值范围1-100，默认大小20 
 * @param pageNumber 页码。取值大于零，默认值为1 
 * @return NSString * 分享
 */
-(NSString *) listShareByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error;

@end
