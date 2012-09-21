//
//  EntryTableViewCell.h
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface EntryTableViewCell : UITableViewCell
{
    Entry* _entry;
}

@property Entry* entry;
@property IBOutlet UILabel* tableViewLabel;

@end
