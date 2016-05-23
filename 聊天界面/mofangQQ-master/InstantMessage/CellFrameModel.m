//
//  CellFrameModel.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//


@implementation CellFrameModel
#define padding 10
- (void)setMessage:(MessageModel *)message
{
    _message = message;
    CGRect frame = [UIScreen mainScreen].bounds;
    
    //时间frame
    if (message.showTime) {
        CGFloat timeFrameX = 0;
        CGFloat timeFrameY = 0;
        CGFloat timeFrameW = frame.size.width;
        CGFloat timeFrameH = timeH;
        _timeFrame = CGRectMake(timeFrameX, timeFrameY, timeFrameW, timeFrameH);
    }
    
    //2.头像的Frame  来自谁的消息(0:好友,1:我) ? padding : 屏幕宽-padding-头像宽
    CGFloat iconFrameX = message.type ? padding : (frame.size.width - padding - iconW);
    //取timeframe的y轴+h
    CGFloat iconFrameY = CGRectGetMaxY(_timeFrame);
    //40
    CGFloat iconFrameW = iconW;
    //40
    CGFloat iconFrameH = iconH;
    _iconFrame = CGRectMake(iconFrameX, iconFrameY, iconFrameW, iconFrameH);
    
    //115 max
    CGSize textMaxSize = CGSizeMake(textW, MAXFLOAT);
    //text的size
    CGSize textSize = [message.text sizeWithFont:[UIFont systemFontOfSize:14.0] maxSize:textMaxSize];
    //气泡size  宽:padding+文字宽+padding  高:padding+文字高+padding
    CGSize textRealSize = CGSizeMake(textSize.width + textPadding * 2, textSize.height + textPadding * 2);
    //text的Y轴  头像的y轴
    CGFloat textFrameY = iconFrameY;
    //text的X轴  信息的类型(0:好友 1:我) ? padding+头像+padding : (屏幕宽-(padding+头像+padding+气泡宽))
    CGFloat textFrameX = message.type ? (2 * padding + iconFrameW) : (frame.size.width - (padding * 2 + iconFrameW + textRealSize.width));
    _textFrame = (CGRect){textFrameX,textFrameY,textRealSize};
    //cell的高度 (头像的Y轴,文字的Y轴加padding)
    _cellHeight = MAX(CGRectGetMaxY(_iconFrame), CGRectGetMaxY(_textFrame) + padding);
}
@end
