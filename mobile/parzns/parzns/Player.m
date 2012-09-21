//
//  Player.m
//  parzns
//
//  Created by Jason Sie on 12-09-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

static Player* currentPlayer;

@implementation Player

+ (Player *)currentPlayer
{
    if (!currentPlayer)
    {
        currentPlayer = [Player new];
    }
    return currentPlayer;
}


- (id)init
{
    if (self = [super init])
    {
        if (FBSession.activeSession.isOpen)
        {
            [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) 
            {
                 if (!error)
                 {
                     userData = user;
                 }
            }];      
        }
    }
    return self;
}

- (NSString *)firstName
{
    return  [userData first_name];
}

- (NSString *)lastName
{
    return  [userData last_name];
}

- (NSString *)fbuid
{
    return [userData id];
}

@end
