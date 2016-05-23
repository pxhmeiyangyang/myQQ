//
//  MessageCell.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//


@interface MessageCell ()
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UIButton *textView;
@end
@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    self.backgroundView = nil;
    self.backgroundColor = [UIColor clearColor];
    //时间
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.timeLabel];
    //头像
    self.iconView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.iconView];
    //内容
    self.textView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.textView.titleLabel.numberOfLines = 0;
    self.textView.titleLabel.font = [UIFont systemFontOfSize:13];
    self.textView.contentEdgeInsets = UIEdgeInsetsMake(textPadding, textPadding, textPadding, textPadding);
    [self.contentView addSubview:self.textView];
    return self;
}

- (void)setCellFrame:(CellFrameModel *)cellFrame
{
    _cellFrame = cellFrame;
    MessageModel *message = cellFrame.message;
    //时间
    _timeLabel.frame = cellFrame.timeFrame;
    _timeLabel.text = message.time;
    //头像
    _iconView.frame = cellFrame.iconFrame;
    _iconView.layer.masksToBounds = YES;
    _iconView.layer.cornerRadius = self.iconView.bounds.size.width*0.5;
    NSString *iconStr = message.type ? @"other" : @"me";
    _iconView.image = [UIImage imageNamed:iconStr];
    //气泡
    _textView.frame = cellFrame.textFrame;
    //气泡样式
    NSString *textBg = message.type ? @"chat_recive_nor" : @"chat_send_nor";
    //字体颜色
    UIColor *textColor = message.type ? [UIColor blackColor] : [UIColor whiteColor];
    //内容
    [_textView setTitle:message.text forState:UIControlStateNormal];
    //内容颜色
    [_textView setTitleColor:textColor forState:UIControlStateNormal];
    //气泡背景
    [_textView setBackgroundImage:[UIImage resizeImage:textBg] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
