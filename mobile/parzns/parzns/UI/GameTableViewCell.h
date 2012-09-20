//
//  GameTableViewCell.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface GameTableViewCell : UITableViewCell
{
    Game* _game;
}

@property Game* game;

@end
