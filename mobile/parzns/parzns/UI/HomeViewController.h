//
//  HomeScreenViewController.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <UIKit/UIKit.h>
#import "GameTableViewDataSource.h"

@interface HomeViewController : UIViewController<UITableViewDelegate>
{
    GameTableViewDataSource* gameListDataSource;
}

@property IBOutlet UIButton* startGameButton;
@property IBOutlet UITableView* gameList;

- (IBAction)startNewGame:(id)sender;

@end
