//
//  GameDetailsViewController.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "GameDetailsViewController.h"

@interface GameDetailsViewController ()

@end

@implementation GameDetailsViewController

@synthesize gameDescription=_gameDescription;
@synthesize entryList=_entryList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    entryListDataSource = [[EntryTableViewDataSource alloc] initWithTableView:_entryList];
    
    _entryList.dataSource = entryListDataSource;
    
    [entryListDataSource sync];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (Game *)game
{
    return _game;
}

- (void)setGame:(Game *)game
{
    _game = game;
    
}

@end
