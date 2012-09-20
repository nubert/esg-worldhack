//
//  GameTableViewDataSource.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameTableViewDataSource : NSObject<UITableViewDataSource>
{
    UITableView* tableView;
    NSMutableArray* games;
}

- (id)initWithTableView:(UITableView*)tableView;

- (void)sync;

@end
