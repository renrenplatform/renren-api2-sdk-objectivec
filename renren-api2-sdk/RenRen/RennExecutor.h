//
//  RennExecutor.h
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RennResponse.h"
#import "RennRequest.h"

//#define API_SERVER     @"api.renren.com"
//#define API_PORT    @"80"

@interface RennExecutor : NSObject
-(RennResponse *) execute:(RennRequest*) request;
@end
