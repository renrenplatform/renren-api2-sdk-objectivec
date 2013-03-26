//
//  NotificationService.h
//  renren-api2-sdk
//
//  Auto Created by SDK-Generator
//  Copyright (c) 2013年 RenRen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseService.h"
 
@interface NotificationService : BaseService
/**
 * 以用户身份向用户发送通知
 * @param content 通知的内容，可以是XNML类型的文本信息，支持的XNML有<xn:name/>和<a/>，请注意：使用<xn:name/>标签的时候，其uid属性值只能是真实的用户id（阿拉伯数字）。例如：hello,<xn:name uid="200032219" linked="true"/> ，去看看这部电影<a href="http://www.tudou.com/programs/view/Tzpw9PIj8zM/">狮子王</a> 
 * @param userIds 接收通知的用户列表。这些用户必须是当前登录用户的好友或应用安装用户。请确保一次传入的用户id数少于20个。不能给当前用户发送通知，发送的通知会被忽略 
 * @return NSString * 发送成功返回1
 */
-(NSString *) putNotificationUserWithContent:(NSString *) content UserIds:(NSArray *) userIds error:(NSError **) error;

/**
 * 以应用身份向用户发送通知
 * @param content 通知的内容，可以是XNML类型的文本信息，支持的XNML有<xn:name/>和<a/>，请注意：使用<xn:name/>标签的时候，其uid属性值只能是真实的用户id（阿拉伯数字）。例如：hello,<xn:name uid="200032219" linked="true"/> ，去看看这部电影<a href="http://www.tudou.com/programs/view/Tzpw9PIj8zM/">狮子王</a> 
 * @param userIds 接收通知的用户列表。这些用户必须安装了此应用。请确保一次传入的用户id数少于20个 
 * @return NSString * 发送成功返回1
 */
-(NSString *) putNotificationAppWithContent:(NSString *) content UserIds:(NSArray *) userIds error:(NSError **) error;

@end
