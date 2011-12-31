//
//  Cache.m
//  MisoUIV3
//
//  Created by HEENA RASTOGI on 12/13/11.
//  Copyright (c) 2011 Miso Media. All rights reserved.
//

#import "Cache.h"

@implementation Cache
+(void)setData:(NSString*)data forKey:(NSString*)key andExpiration:(NSDate*)expirationDate
{
    NSMutableDictionary* cacheDict =[[NSMutableDictionary alloc] init];
  
    [cacheDict setValue:expirationDate forKey:@"expiration"];
    [cacheDict setValue:data forKey:@"data"];
    
    [[NSUserDefaults standardUserDefaults] setObject:cacheDict forKey:key];
    
    [cacheDict release];
    
}

+(NSString*)getData:(NSString*)key
{
    NSDictionary* cacheDict = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSDate* expirationDate = [cacheDict valueForKey:@"expiration"];
    NSTimeInterval timeDifference = [expirationDate timeIntervalSinceNow];
    NSString* data;
    if(timeDifference < 0)           
    {
        NSLog(@"data expired");
        data = nil;
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:key];
    }
    else
    {
        NSLog(@"retrieved cache data");
        data = [cacheDict valueForKey:@"data"];
    }
    return data;
}
@end
