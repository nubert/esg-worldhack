//
//  ServerAPI.m
//  parzns
//
//  Created by Jason Sie on 12-09-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ServerAPI.h"
#import "Player.h"
#import "JSONKeys.h"
#import "NetworkConnector.h"

@interface ServerAPI()
+ (NSDictionary *)serviceCall:(NSString *)call data:(NSDictionary *)data;
@end

@implementation ServerAPI

+ (NSDictionary *)getGameSettings
{
    return [ServerAPI serviceCall:@"getGameSettings" data:[NSDictionary dictionary]];
}

+ (NSDictionary *)getUserState
{
    return [ServerAPI serviceCall:@"getUserState" data:[NSDictionary dictionary]];
}

+ (NSDictionary *)getCurrentGames
{
    return [ServerAPI serviceCall:@"getCurrentGames" data:[NSDictionary dictionary]];
}

+ (NSDictionary *)getLeaderboard
{
    return [ServerAPI serviceCall:@"getLeaderboard" data:[NSDictionary dictionary]];
}

+ (NSDictionary *)startGame
{
    return [ServerAPI serviceCall:@"startGame" data:[NSDictionary dictionary]];
}

+ (NSDictionary *)vote:(int)gameID entryID:(int)entryID
{
    NSDictionary *userData = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:gameID], KEY_GAMEID,
                              [NSNumber numberWithInt:entryID], KEY_ENTRYID,
                              nil];
    return [ServerAPI serviceCall:@"vote" data:userData];
}

+ (NSDictionary *)addUser
{
    NSDictionary *userData = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[Player currentPlayer] firstName], KEY_FIRSTNAME,
                              [[Player currentPlayer] lastName], KEY_LASTNAME,
                              nil];
    return [ServerAPI serviceCall:@"addUser" data:userData];
}


#pragma mark Private

+ (NSDictionary *)serviceCall:(NSString *)call data:(NSDictionary *)data
{
    NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithDictionary:data];
    Player *currentPlayer = [Player currentPlayer];
    [userData setObject:[currentPlayer fbuid] forKey:KEY_FBUID];
    return [NetworkConnector postServer:call data:userData];
}

@end
