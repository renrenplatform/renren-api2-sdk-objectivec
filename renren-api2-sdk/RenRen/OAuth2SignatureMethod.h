//
//  OAuth2SignatureMethod.h
//  renren_sdk
//
//  Created by neuprince on 13-3-8.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuth2SignatureMethod : NSObject
{
////    NSString *nonce;
//    NSString *timeStamp;
//    NSString *secret;
}

-(NSString *) getRandomStringForLength:(int)length;
-(NSString *) sign:(NSString *)data secret:(NSString *)key;
-(NSString *) normalizeRequestByTimestamp:(NSString *)timeStamp nonce:(NSString*)nonce ext:(NSString*)ext httpMethod:(NSString*)httpMethod uri:(NSString*)uri host:(NSString*)host port:(NSString*)port;

@end
