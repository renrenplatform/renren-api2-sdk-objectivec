//
//  UserService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface UserService : BaseService
/**
 * 批量获取用户信息
 * @param userIds 批量获取的用户IDs 
 * @return NSString * 用户
 */
-(NSString *) batchUserByUserIds:(NSArray *) userIds error:(NSError **) error;

/**
 * 以分页的方式获取某个用户与当前登录用户的共同好友
 * @param userId 用户ID 
 * @return NSString * 用户
 */
-(NSString *) listUserFriendMutualByUserId:(NSNumber *) userId error:(NSError **) error;

/**
 * 获取用户信息
 * @param userId 用户ID 
 * @return NSString * 用户
 */
-(NSString *) getUserByUserId:(NSNumber *) userId error:(NSError **) error;

/**
 * 获取当前登录用户在某个应用里的好友列表
 * @return NSString * 用户
 */
-(NSString *) listUserFriendApp:(NSError **) error;

/**
 * 获取某个用户的好友列表
 * @param userId 用户ID 
 * @param pageSize 页面大小。取值范围1-100，默认大小20 
 * @param pageNumber 页码。取值大于零，默认值为1 
 * @return NSString * 用户
 */
-(NSString *) listUserFriendByUserId:(NSNumber *) userId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error;

@end
