//
//  UbbService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface UbbService : BaseService
/**
 * 获取人人网ubb列表
 * @return NSString * UBB表情
 */
-(NSString *) listUbb:(NSError **) error;

@end
