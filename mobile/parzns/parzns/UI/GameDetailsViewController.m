//
//  GameDetailsViewController.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "GameDetailsViewController.h"
//#import "ServerAPI.h"
#import "EntryTableViewCell.h"

@interface GameDetailsViewController ()

@end

@implementation GameDetailsViewController

@synthesize gameDescription=_gameDescription;
@synthesize entryList=_entryList;
@synthesize definition1;
@synthesize definition2;
@synthesize definition3;

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
    _entryList.delegate = self;
    
    [entryListDataSource sync];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EntryTableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //[ServerAPI vote:_game.gameID entryID:cell.entry.entryID];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString* entry;
    
    textField.text = @"";
    
}

- (Game *)game
{
    return _game;
}

- (void)setGame:(Game *)game
{
    _game = game;
    _gameDescription.text = [game toString];
}

@end
