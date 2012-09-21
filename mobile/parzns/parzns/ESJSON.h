//
//  ESJSON.h
//  ESEngine
//
//  Created by jason on 11-10-25.
//  Copyright (c) 2011 East Side Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESJSON : NSObject

+ (NSData*)jsonWithData:(id)data;       // data must be NSArray or NSDictionary
+ (NSDictionary*)dataWithJSON:(NSData*)json;
+ (NSDictionary*)dataWithJSONString:(NSString*)jsonString;

+ (NSString *)stringWithObject:(id)object;

@end
