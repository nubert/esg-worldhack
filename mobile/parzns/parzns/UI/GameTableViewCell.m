//
//  GameTableViewCell.m
//  parzns
//
//  Created by Tim Mann on 12-09-20.
//
//

#import "GameTableViewCell.h"

@implementation GameTableViewCell

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

    // Configure the view for the selected state
}

- (Game *)game
{
    return _game;
}

- (void)setGame:(Game *)aGame
{
    _game = aGame;
    self.textLabel.text = [_game toString];
}

@end
