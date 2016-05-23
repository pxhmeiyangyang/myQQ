//
//  MenuHeaderView.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/9.
//  Copyright © 2015年 林英伟. All rights reserved.
//


@interface MenuHeaderView()
@property (nonatomic,strong) YLImageView *headImg;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *signLabel;
@end
@implementation MenuHeaderView
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
    YLImageView *headImg = [[YLImageView alloc]init];
    self.headImg = headImg;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = [UIFont systemFontOfSize:18];
    self.nameLabel = nameLabel;
    
    UILabel *signLabel = [[UILabel alloc]init];
    signLabel.font = [UIFont systemFontOfSize:16];
    self.signLabel = signLabel;
    
    [self addSubview:headImg];
    [self addSubview:nameLabel];
    [self addSubview:signLabel];
    
    self.headImg.sd_layout
    .widthIs(55)
    .heightIs(55)
    .topSpaceToView(self,20)
    .leftSpaceToView(self,20);
    
    self.nameLabel.sd_layout
    .topSpaceToView(self,30)
    .leftSpaceToView(self.headImg,10)
    .rightSpaceToView(self,30)
    .heightRatioToView(self.headImg,0.4);
    
    self.signLabel.sd_layout
    .topSpaceToView(self.headImg,1)
    .leftEqualToView(self.headImg)
    .rightSpaceToView(self,30)
    .heightRatioToView(self.headImg,0.4);
}

- (void)setPersonalInfor:(PersonalInfor *)personalInfor
{
    _personalInfor = personalInfor;
    _headImg.layer.masksToBounds = YES;
    _headImg.layer.cornerRadius = _headImg.frame.size.height * 0.5;
    _headImg.image = [YLGIFImage imageNamed:personalInfor.imageStr];
    
    _nameLabel.text = personalInfor.name;
    _nameLabel.textColor = [UIColor whiteColor];
    
    _signLabel.text = personalInfor.sign;
    _signLabel.textColor = [UIColor whiteColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
