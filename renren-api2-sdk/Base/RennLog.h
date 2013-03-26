//
//  RennLog.h
//  renren-api2-sdk
//
//  Created by 杨 飞 on 13-3-22.
//  Copyright (c) 2013年 RenRen. All rights reserved.
//

//发版前必做:将log开关关掉
//#define RMLog_DEBUG

#ifndef RMLog_DEBUG
#define RMLog(message, ...)
#else
#define RMLog(message, ...) NSLog(@"[RenRenSDK]:%@", [NSString stringWithFormat:message, ##__VA_ARGS__])
#endif