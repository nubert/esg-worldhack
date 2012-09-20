//
//  GameDetailsViewController.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "ViewController.h"
#import "EntryTableViewDataSource.h"
#import "Game.h"

@interface GameDetailsViewController : ViewController<UITableViewDelegate>
{
    EntryTableViewDataSource* entryListDataSource;
    Game* _game;
}

@property Game* game;

@property IBOutlet UITableView* entryList;
@property IBOutlet UILabel* gameDescription;

@end
