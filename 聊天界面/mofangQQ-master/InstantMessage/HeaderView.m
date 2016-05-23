//
//  HeaderView.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//

@interface HeaderView ()
@property (nonatomic,strong) UIButton *bgButton;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,copy) reloadDataBlock reBlock;
@end
@implementation HeaderView
+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *headIdentifier = @"header";
    HeaderView *hv = (HeaderView*)[tableView dequeueReusableCellWithIdentifier:headIdentifier];
    if (!hv) {
        hv = [[HeaderView alloc]initWithReuseIdentifier:headIdentifier];
    }
    return hv;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    [self initUI];
    return self;
}

- (void)initUI
{
     //黑色箭头
    UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
    [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
    [bgButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    [bgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //图片居中
    bgButton.imageView.contentMode = UIViewContentModeCenter;
    //决定子视图的显示范围,当超出范围时,no不剪裁,yes会剪裁
    bgButton.imageView.clipsToBounds = NO;
    //内容的水平方向的对齐方式 = 居左
    bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    bgButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [bgButton addTarget:self action:@selector(headBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bgButton];
    self.bgButton = bgButton;
    
    UILabel *numLabel = [[UILabel alloc]init];
    numLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:numLabel];
    self.numLabel = numLabel;
}

- (void)headBtnClick
{
    self.FriendGroup.opened = !self.FriendGroup.isOpened;
    self.reBlock();
}

- (void)setFriendGroup:(FriendGroup *)FriendGroup
{
    _FriendGroup = FriendGroup;
    [_bgButton setTitle:FriendGroup.name forState:UIControlStateNormal];
    _numLabel.text = [NSString stringWithFormat:@"%ld/%ld",(long)FriendGroup.online,(unsigned long)FriendGroup.friends.count];
}

//通知已经到新父视图
- (void)didMoveToSuperview
{
    //是否打开(1:0)?1.5:0
    self.bgButton.imageView.transform = self.FriendGroup.isOpened ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bgButton.frame = self.bounds;
    self.numLabel.frame = CGRectMake(self.frame.size.width-70, 0, 60, self.frame.size.height);
}

- (void)reloadData:(reloadDataBlock)block
{
    self.reBlock = block;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
