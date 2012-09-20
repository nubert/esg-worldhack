//
//  GameTableViewDataSource.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "GameTableViewDataSource.h"
#import "GameTableViewCell.h"

@implementation GameTableViewDataSource

- (id)initWithTableView:(UITableView *)aTableView
{
    self = [super init];
    if (self)
    {
        tableView = aTableView;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameTableViewCell* cell = [[GameTableViewCell alloc] init];
    
    cell.game = [games objectAtIndex:[indexPath indexAtPosition:1]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return games.count;
    return 0;
}

- (void)sync
{
    [games removeAllObjects];
    
    for (int i = 0; i < 5; i++)
    {
        Game* game = [[Game alloc] init];
        game.acronym = @"XYZ";
        game.players = [NSArray arrayWithObjects:@"Joe", @"Bob", nil];
        game.verb = @"%d loves to %d";
        [games addObject:game];
    }
    
    [tableView reloadData];
}

@end
