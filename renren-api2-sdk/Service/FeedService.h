//
//  FeedService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface FeedService : BaseService
/**
 * 发送自定义新鲜事。新鲜事会发布用户的个人动态信息到用户人人网主页，<br> 同时会出现在好友的新鲜事中。
 * @param message 用户输入的自定义内容。注意：最多200个字符 
 * @param title 新鲜事标题 注意：最多30个字符 
 * @param actionTargetUrl 新鲜事动作模块链接 
 * @param imageUrl 新鲜事图片地址 
 * @param description 新鲜事主体内容 注意：最多200个字符。 
 * @param subtitle 新鲜事副标题 注意：最多20个字符 
 * @param actionName 新鲜事动作模块文案。 注意：最多10个字符 
 * @param targetUrl 新鲜事标题和图片指向的链接 
 * @return NSString * 发布新鲜事的ID
 */
-(NSString *) putFeedWithMessage:(NSString *) message Title:(NSString *) title ActionTargetUrl:(NSString *) actionTargetUrl ImageUrl:(NSString *) imageUrl Description:(NSString *) description Subtitle:(NSString *) subtitle ActionName:(NSString *) actionName TargetUrl:(NSString *) targetUrl error:(NSError **) error;

@end
