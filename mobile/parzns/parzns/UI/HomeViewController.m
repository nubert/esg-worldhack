//
//  HomeScreenViewController.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "HomeViewController.h"
#import "GameDetailsViewController.h"
#import "GameTableViewCell.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize gameList=_gameList;
@synthesize startGameButton=_startGameButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    gameListDataSource = [[GameTableViewDataSource alloc] initWithTableView:_gameList];
    
    _gameList.dataSource = gameListDataSource;
    
    _gameList.delegate = self;
    
    [gameListDataSource sync];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startNewGame:(id)sender
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameDetailsViewController* gameDetailsViewController = [[GameDetailsViewController alloc] initWithNibName:@"GameDetails" bundle:nil];

    gameDetailsViewController.game = ((GameTableViewCell*)[tableView cellForRowAtIndexPath:indexPath]).game;
    
    [self presentModalViewController:gameDetailsViewController animated:NO];
}

@end
