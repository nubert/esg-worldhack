//
//  ServerAPI.h
//  parzns
//
//  Created by Jason Sie on 12-09-20.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerAPI : NSObject

+ (NSDictionary *)getGameSettings;
+ (NSDictionary *)getUserState;
+ (NSDictionary *)getCurrentGames;
+ (NSDictionary *)getLeaderboard;
+ (NSDictionary *)startGame;
+ (NSDictionary *)vote:(int)gameID entryID:(int)entryID;
+ (NSDictionary *)addUser;

@end
