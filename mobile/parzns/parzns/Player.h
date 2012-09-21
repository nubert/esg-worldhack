//
//  Player.h
//  parzns
//
//  Created by Jason Sie on 12-09-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface Player : NSObject
{
    NSDictionary<FBGraphUser> *userData;
}

+ (Player *)currentPlayer;
- (NSString *)firstName;
- (NSString *)lastName;
- (NSString *)fbuid;

@end
