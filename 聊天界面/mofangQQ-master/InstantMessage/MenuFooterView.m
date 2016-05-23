//
//  MenuFooterView.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/13.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import "MenuFooterView.h"

@implementation MenuFooterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    [self initUI];
    return self;
}

- (void)initUI
{
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    setBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [setBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [setBtn setTitle:@"设置" forState:UIControlStateNormal];
    [setBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [setBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    
    UIButton *nightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [nightBtn setImage:[UIImage imageNamed:@"night"] forState:UIControlStateNormal];
    [nightBtn setTitle:@"夜间" forState:UIControlStateNormal];
    [nightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [nightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self addSubview:setBtn];
    [self addSubview:nightBtn];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.font = [UIFont systemFontOfSize:14];
    label2.numberOfLines = 2;
    label2.text = @"15°\n东莞";
    NSRange range = [label2.text rangeOfString:@"°"];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:label2.text];
    [att addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:40]} range:NSMakeRange(0, range.location + 1)];
    label2.attributedText = att;
    
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor whiteColor];
    
    UIButton *regionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [regionBtn addSubview:label2];
    [self addSubview:regionBtn];
    
    setBtn.sd_layout
    .widthIs(60)
    .heightIs(30)
    .leftSpaceToView(self,20)
    .bottomSpaceToView(self,10);
    
    nightBtn.sd_layout
    .widthIs(60)
    .heightIs(30)
    .leftSpaceToView(setBtn,10)
    .bottomEqualToView(setBtn);
    
    regionBtn.sd_layout
    .widthIs(70)
    .heightIs(regionBtn.frame.size.width)
    .leftSpaceToView(nightBtn,30)
    .bottomEqualToView(setBtn);
    
    label2.sd_layout
    .widthIs(regionBtn.frame.size.width)
    .heightIs(regionBtn.frame.size.width)
    .bottomSpaceToView(regionBtn,0)
    .leftSpaceToView(regionBtn,0);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
