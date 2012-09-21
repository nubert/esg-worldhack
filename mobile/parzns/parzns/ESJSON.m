//
//  ESJSON.m
//  ESEngine
//
//  Created by jason on 11-10-25.
//  Copyright (c) 2011 East Side Games. All rights reserved.
//

#import "ESJSON.h"
#import "ESSBJson.h"

@implementation ESJSON

+ (NSData*)jsonWithData:(id)data
{
    NSData *json = nil;
    
    if (data)
    {
        Class jsonSerializationClass = NSClassFromString(@"NSJSONSerialization");
        if (jsonSerializationClass)
        {
            NSError *error = nil;
            json = [jsonSerializationClass dataWithJSONObject:data 
                                                      options:NSJSONWritingPrettyPrinted
                                                        error:&error];
            if (error)
            {
                NSLog(@"JSON serialization error %@", error);
            }
        }
        else
        {
            json = [[ESJsonWriter new] dataWithObject:data];
        }
    }
    
    return json;
}

+ (NSDictionary*)dataWithJSON:(NSData *)json
{
    NSDictionary *data = nil;
    
    if (json)
    {
        Class jsonSerializationClass = NSClassFromString(@"NSJSONSerialization");
        if (jsonSerializationClass)
        {
            NSError *error = nil;
            data = [jsonSerializationClass JSONObjectWithData:json
                                                      options:NSJSONReadingAllowFragments
                                                        error:&error];
            if (error)
            {
                NSLog(@"JSON serialization error %@", error);
            }
        }
        else
        {
            data = [[ESJsonParser new] objectWithData:json];
        }
    }
    
    return data;
}

+ (NSDictionary*)dataWithJSONString:(NSString *)jsonString
{
    NSDictionary *data = nil;
    
    if (jsonString)
    {
        data = [[ESJsonParser new] objectWithString:jsonString];
    }
    
    return data;
}

+ (NSString *)stringWithObject:(id)object
{
    NSString * string = nil;
    
    if ( object )
    {
        string = [[ESJsonWriter new] stringWithObject:object];
    }
    
    return string;
}

@end
