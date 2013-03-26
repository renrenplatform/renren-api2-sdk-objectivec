//
//  AccessToken.h
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
	Bearer,
    MAC
}Type;

@interface AccessToken : NSObject
+ (NSString *) MAC;
+ (NSString *) Bearer;
@property (nonatomic, readonly) NSString * TypeString;
@property (nonatomic, assign) Type type;
@property (nonatomic, copy) NSString * accessToken;
@property (nonatomic, copy) NSString * refreshToken;
@property (nonatomic, copy) NSString * macKey;
@property (nonatomic, copy) NSString * macAlgorithm;
@end

