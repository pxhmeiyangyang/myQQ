//
//  LinkManCell.m
//  myQQ
//
//  Created by pxh on 16/5/24.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "LinkManCell.h"

@interface LinkManCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLable;


@end

@implementation LinkManCell

-(void)layoutSubviews{
    [super layoutSubviews];
    //在这里做界面的适配和重新布局
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.cornerRadius = CGRectGetWidth(_headImageView.frame) * 0.5;
}

+(CGFloat)getCellHeight{
    return 70.0;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
