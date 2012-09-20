//
//  Game.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property NSString* acronym;
@property NSString* verb;
//@property Player* player1;
//@property Player* player2;
@property NSArray* entries;

- (NSString*)toString;

@end
