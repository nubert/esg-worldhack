//
//  EntryTableViewDataSource.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EntryTableViewDataSource : NSObject<UITableViewDataSource>
{
    UITableView* tableView;
    NSMutableArray* entries;
}

- (id)initWithTableView:(UITableView*)tableView;

- (void)sync;


@end
