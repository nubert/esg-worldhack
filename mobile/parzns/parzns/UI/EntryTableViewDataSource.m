//
//  EntryTableViewDataSource.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "EntryTableViewDataSource.h"
#import "EntryTableViewCell.h"
#import "Entry.h"

@implementation EntryTableViewDataSource

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
    EntryTableViewCell* cell = [[EntryTableViewCell alloc] init];
    
    cell.entry = [entries objectAtIndex:[indexPath indexAtPosition:1]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return entries.count;
    return 0;
}

- (void)sync
{
    [entries removeAllObjects];
    
    for (int i = 0; i < 5; i++)
    {
        Entry* entry = [[Entry alloc] init];
        entry.definition = @"Xtra Young Zebras";
        [entries addObject:entry];
    }
    
    [tableView reloadData];
}
@end
