//
//  BlogService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface BlogService : BaseService
/**
 * 以分页的方式获取某个用户的日志列表
 * @param ownerId 日志所有者的ID 
 * @param pageSize 页面大小。取值范围1-200，默认大小20 
 * @param pageNumber 页码。取值大于零，默认值为1 
 * @return NSString * 日志
 */
-(NSString *) listBlogByOwnerId:(NSNumber *) ownerId PageSize:(NSNumber *) pageSize PageNumber:(NSNumber *) pageNumber error:(NSError **) error;

/**
 * 创建一篇日志
 * @param title 日志的标题 
 * @param accessControl 日志的访问控制 
 * @param password 日志的访问密码,1-16个字符 
 * @param content 日志的内容
 * @return NSString * 日志
 */
-(NSString *) putBlogWithTitle:(NSString *) title AccessControl:(NSString *) accessControl Password:(NSString *) password Content:(NSString *) content error:(NSError **) error;

/**
 * 获取某个用户的某篇日志
 * @param ownerId 日志所有者的ID 
 * @param blogId 日志的ID 
 * @param password 日志访问密码 
 * @return NSString * 日志
 */
-(NSString *) getBlogByOwnerId:(NSNumber *) ownerId BlogId:(NSNumber *) blogId Password:(NSString *) password error:(NSError **) error;

@end
