//
//  HomeScreenViewController.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "HomeViewController.h"

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

@end
