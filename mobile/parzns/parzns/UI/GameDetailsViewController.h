//
//  GameDetailsViewController.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <UIKit/UIKit.h>
#import "EntryTableViewDataSource.h"
#import "Game.h"

@interface GameDetailsViewController : UIViewController<UITableViewDelegate>
{
    EntryTableViewDataSource* entryListDataSource;
    Game* _game;
}

@property Game* game;

@property IBOutlet UITableView* entryList;
@property IBOutlet UILabel* gameDescription;

@end
