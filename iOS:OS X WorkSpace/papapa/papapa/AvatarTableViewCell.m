//
//  AvatarTableViewCell.m
//  papapa
//
//  Created by 王志龙 on 15/8/6.
//  Copyright (c) 2015年 wangzhilong. All rights reserved.
//

#import "AvatarTableViewCell.h"

@implementation AvatarTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.avatarImg.layer.cornerRadius = self.avatarImg.bounds.size.width / 2;
    self.avatarImg.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
