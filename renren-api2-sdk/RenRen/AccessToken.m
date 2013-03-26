//
//  AccessToken.m
//  renren_ios_sdk
//
//  Created by neuprince on 13-3-4.
//  Copyright (c) 2013年 renren. All rights reserved.
//

#import "AccessToken.h"

@implementation AccessToken
@synthesize type;
@synthesize accessToken;
@synthesize refreshToken;
@synthesize macKey;
@synthesize macAlgorithm;



+(NSString *) MAC
{
    return @"MAC";
}

+(NSString *) Bearer
{
    return @"Bearer";
}

- (NSString *) TypeString
{
    if (MAC == type) {
        return @"MAC";
    }
    else if(Bearer == type)
        return @"Bearer";
    else
    {   assert(FALSE);
        return nil;
    }
}

-(NSString *)description
{
    return [NSString
            stringWithFormat:@"\naccessToken:%@\nrefreshToken:%@\nmacKey:%@\nmacAlgorithm:%@\ntype:%@",
            accessToken,
            refreshToken,
            macKey,
            macAlgorithm,
            [self TypeString]];
}
@end
