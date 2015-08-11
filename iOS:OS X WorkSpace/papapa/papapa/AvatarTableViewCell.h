//
//  AvatarTableViewCell.h
//  papapa
//
//  Created by 王志龙 on 15/8/6.
//  Copyright (c) 2015年 wangzhilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;

@end
