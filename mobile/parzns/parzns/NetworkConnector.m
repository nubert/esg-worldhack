//
//  NetworkConnector.m
//  parzns
//
//  Created by Gabriel Karkanis on 12-09-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NetworkConnector.h"
#import "ESJSON.h"

@implementation NetworkConnector

+(NSDictionary*) postServer:(NSString*)serviceCall data:(NSDictionary*)data
{
    NSString *urlString = [@"http://hackathon.eastsidegamestudio.com/esg-worldhack/backend/service/" stringByAppendingString:serviceCall];
    
    NSData* encodedData = [ESJSON jsonWithData:data];
    
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    [request setURL:[NSURL URLWithString:[NSURL URLWithString:urlString]]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:encodedData];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&err];
     
    return [ESJSON dataWithJSON:response];
}

@end
