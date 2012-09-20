//
//  EntryTableViewCell.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "EntryTableViewCell.h"

@implementation EntryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    if (selected)
    {
        self.backgroundColor = [UIColor greenColor];
    }
    else
    {
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (Entry *)entry
{
    return _entry;
}

- (void)setEntry:(Entry *)anEntry
{
    _entry = anEntry;
}

@end
