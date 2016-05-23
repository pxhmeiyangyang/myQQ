//
//  ChatFrameModel.m
//  chat
//
//  Created by T_Yang on 15/9/2.
//  Copyright © 2015年 杨 天. All rights reserved.
//

#import "ChatFrameModel.h"

@implementation ChatFrameModel

- (void)setChatModel:(ChatModel *)chatModel {
    _chatModel = chatModel;
    
    //设置标题label的高度 如果相同 高度为0 即不显示
    CGFloat titleLabelHeight = chatModel.hiddenTime ? 0 : 30;
    
    _titleLabelFrame = CGRectMake(0, 0, kWidth, titleLabelHeight);

#define kContentBtnWidth (contentBtnSize.width + 40)
#define kContentBtnHeight (contentBtnSize.height + 35)
    
    //间距
    CGFloat margin = 10;
    //头像大小
    CGFloat iconWH = 50;
    //文字大小
    CGSize contentBtnSize = [self sizeWithText:_chatModel.text];
    //头像大小 50 * 50
    if ([_chatModel.type isEqualToNumber:@0]) {
        _iconImageViewFrame = CGRectMake(kWidth - iconWH - margin, CGRectGetMaxY(_titleLabelFrame), iconWH, iconWH);
        
        _contentBtnFrame = CGRectMake(kWidth - kContentBtnWidth - iconWH - margin - margin,
                                      CGRectGetMaxY(_titleLabelFrame),
                                      kContentBtnWidth,
                                      kContentBtnHeight);
    }else {
        _iconImageViewFrame = CGRectMake(margin, CGRectGetMaxY(_titleLabelFrame), iconWH, iconWH);
        
        _contentBtnFrame = CGRectMake(margin + iconWH + margin,
                                      CGRectGetMaxY(_titleLabelFrame),
                                      kContentBtnWidth,
                                      kContentBtnHeight);
    }
    _cellHeight = MAX(CGRectGetMaxY(_contentBtnFrame), CGRectGetMaxY(_titleLabelFrame)) + margin;
}

- (CGSize)sizeWithText:(NSString *)text {
    return [text boundingRectWithSize:CGSizeMake(kWidth - 150, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}
                              context:nil].size;
}

@end
