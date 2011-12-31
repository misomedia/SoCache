//
//  Cache.h
//  MisoUIV3
//
//  Created by HEENA RASTOGI on 12/13/11.
//  Copyright (c) 2011 Miso Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject
+(void)setData:(NSString*)data forKey:(NSString*)key andExpiration:(NSDate*)expirationDate;
+(NSString*)getData:(NSString*)key;
@end
