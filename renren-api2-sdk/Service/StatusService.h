//
//  StatusService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface StatusService : BaseService
/**
 * 获取用户状态列表
 * @param ownerId 状态所有者的用户ID 
 * @param pageSize 页面大小。取值范围1-100，默认大小20 
 * @param pageNumber 页码。取值大于零，默认值为1 
 * @return NSString * 状态
 */
-(NSString *) listStatusByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error;

/**
 * 获取用户状态
 * @param statusId 状态ID 
 * @param ownerId 状态所有者的用户ID 
 * @return NSString * 状态
 */
-(NSString *) getStatusByStatusId:(NSNumber *) statusId OwnerId:(NSNumber *) ownerId error:(NSError **) error;

/**
 * 更新用户状态
 * @param content 状态的内容。内容中的UBB表情代码未经过处理，需要开发者自行进行替换。UBB表情参见：[http://wiki.dev.renren.com/wiki/V2/ubb/list 获取人人网ubb列表] 
 * @return NSString * 状态
 */
-(NSString *) putStatusWithContent:(NSString *) content error:(NSError **) error;

/**
 * 分享用户状态
 * @param content 状态的内容。内容中的UBB表情代码未经过处理，需要开发者自行进行替换。UBB表情参见：[http://wiki.dev.renren.com/wiki/V2/ubb/list 获取人人网ubb列表] 
 * @param statusId 状态ID 
 * @param ownerId 状态所有者的用户ID 
 * @return NSString * 状态
 */
-(NSString *) shareStatusWithContent:(NSString *) content StatusId:(NSNumber *) statusId OwnerId:(NSNumber *) ownerId error:(NSError **) error;

@end
