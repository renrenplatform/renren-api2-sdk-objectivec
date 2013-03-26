//
//  RennResponse.h
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RennResponse : NSObject
@property (nonatomic,assign) int responseCode;
@property (nonatomic,copy) NSString * responseString;
@property (nonatomic,assign) NSError ** error;
@end
