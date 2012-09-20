//
//  Game.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "Game.h"

@implementation Game

//@synthesize player1=_player1;
//@synthesize player2=_player2;
@synthesize acronym=_acronym;
@synthesize verb=_verb;
@synthesize entries=_entries;

- (NSString *)toString
{
    return @"Tim and Gabe are TUC";//[NSString stringWithFormat:@"%@ and %@ %@ %@", _player1.firstName, _player2.firstName, _verb, _acronym];
}

@end
