//
//  SongTableCellTableViewCell.m
//  SonosProjectInterface
//
//  Created by Suma Reddy on 11/9/14.
//  Copyright (c) 2014 Flatiron. All rights reserved.
//

#import "SongTableCellTableViewCell.h"

@interface SongTableCellTableViewCell ()

@end

@implementation SongTableCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.artistLabel];
    [self.contentView addSubview:self.songLabel];
    return self;
}

- (UILabel *)artistLabel {
    if (_artistLabel == nil) {
        _artistLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 15)];
        _artistLabel.font = [UIFont systemFontOfSize:10];
    }
    return _artistLabel;
}

- (UILabel *)songLabel {
    if (_songLabel == nil) {
        _songLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 15)];
        _songLabel.font = [UIFont systemFontOfSize:10];
    }
    return _songLabel;
}

@end
