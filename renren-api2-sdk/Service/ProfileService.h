//
//  ProfileService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface ProfileService : BaseService
/**
 * 获取用户的主页信息，包括各种统计数据。
 * @param userId 用户ID 
 * @return NSString * 个人主页信息
 */
-(NSString *) getProfileByUserId:(NSNumber *) userId error:(NSError **) error;

@end
