//
//  RennRequest.h
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RennRequestDelegate;
@class AccessToken;

typedef enum
{
    PUT,
    DELETE,
    POST,
    GET
}Method;

@interface RennRequest : NSObject

@property (nonatomic, copy) NSString *path;
@property (nonatomic, retain) AccessToken *accessToken;
@property (nonatomic, retain) NSDictionary *textParams;
@property (nonatomic, retain) NSDictionary *fileParams;
@property (nonatomic, retain) NSDictionary *bodyParams;
@property (nonatomic, assign) Method method;
@property (nonatomic, assign) NSError ** error;

+ (RennRequest *) requestWithPath:(NSString *)path
                           method:(Method)method
                      accessToken:(AccessToken *) accessToken
                       textParams:(NSDictionary *)textParams
                       bodyParams:(NSDictionary *)bodyParams
                       fileParams:(NSDictionary *)fileParams
                            error:(NSError **)error;
@end
