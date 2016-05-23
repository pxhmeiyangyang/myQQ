//
//  ChatCell.m
//  chat
//
//  Created by T_Yang on 15/9/2.
//  Copyright © 2015年 杨 天. All rights reserved.
//

#import "ChatCell.h"
#import "ChatFrameModel.h"

@interface ChatCell ()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIButton *contentBtn;
@property (nonatomic, weak) UIImageView *iconImageView;
@end

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = kColor(240, 240, 240);
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.clipsToBounds = YES;
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        iconImageView.layer.cornerRadius = 25;
        iconImageView.layer.masksToBounds = YES;
        iconImageView.layer.borderWidth = 1.0f;
        
        UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:contentBtn];
        self.contentBtn = contentBtn;
        UIImage *btnBackImage = [UIImage imageNamed:@"chat_send_nor"];
        [contentBtn setBackgroundImage:[btnBackImage stretchableImageWithLeftCapWidth:btnBackImage.size.width / 2
                                                                         topCapHeight:btnBackImage.size.height / 2]
                              forState:UIControlStateNormal];
        [contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        contentBtn.titleLabel.numberOfLines = 0;
        contentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        contentBtn.titleEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    }
    return self;
}

- (void)setFrameModel:(ChatFrameModel *)frameModel {
    _frameModel = frameModel;
    
    [self setSubviewsData];
    
    [self setSubviewsFrame];
}

- (void)setSubviewsData {
    self.titleLabel.text = self.frameModel.chatModel.time;
    [self.contentBtn setTitle:self.frameModel.chatModel.text forState:UIControlStateNormal];
    if ([self.frameModel.chatModel.type isEqualToNumber:@0]) {
        self.iconImageView.image = [UIImage imageNamed:@"me"];
        UIImage *btnBackImage = [UIImage imageNamed:@"chat_send_nor"];
        [self.contentBtn setBackgroundImage:[btnBackImage stretchableImageWithLeftCapWidth:btnBackImage.size.width / 2
                                                                         topCapHeight:btnBackImage.size.height / 2]
                              forState:UIControlStateNormal];
        UIImage *btnBackImageHelight = [UIImage imageNamed:@"chat_send_press_pic"];
        [self.contentBtn setBackgroundImage:[btnBackImageHelight stretchableImageWithLeftCapWidth:btnBackImageHelight.size.width / 2
                                                                              topCapHeight:btnBackImageHelight.size.height / 2]
                                   forState:UIControlStateHighlighted];
    }else {
        self.iconImageView.image = [UIImage imageNamed:@"other"];
        UIImage *btnBackImage = [UIImage imageNamed:@"chat_recive_nor"];
        [self.contentBtn setBackgroundImage:[btnBackImage stretchableImageWithLeftCapWidth:btnBackImage.size.width / 2
                                                                              topCapHeight:btnBackImage.size.height / 2]
                                   forState:UIControlStateNormal];
        UIImage *btnBackImageHelight = [UIImage imageNamed:@"chat_recive_press_pic"];
        [self.contentBtn setBackgroundImage:[btnBackImageHelight stretchableImageWithLeftCapWidth:btnBackImageHelight.size.width / 2
                                                                              topCapHeight:btnBackImageHelight.size.height / 2]
                                   forState:UIControlStateHighlighted];
    }
}

- (void)setSubviewsFrame {
    self.titleLabel.frame = self.frameModel.titleLabelFrame;
    self.contentBtn.frame = self.frameModel.contentBtnFrame;
    self.iconImageView.frame = self.frameModel.iconImageViewFrame;
}

@end
