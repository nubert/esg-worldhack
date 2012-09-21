//
//  NetworkConnector.h
//  parzns
//
//  Created by Gabriel Karkanis on 12-09-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConnector : NSObject

+(NSDictionary*) postServer:(NSString*)serviceCall data:(NSDictionary*)data;

@end
