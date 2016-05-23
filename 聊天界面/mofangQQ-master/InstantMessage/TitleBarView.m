//
//  TitleBarView.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/10.
//  Copyright © 2015年 林英伟. All rights reserved.
//

@interface TitleBarView ()

@end

@implementation TitleBarView
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
    self.backgroundColor = [UIColor clearColor];
    YLImageView *imageView = [[YLImageView alloc]init];
    imageView.image = [YLGIFImage imageNamed:@"niconiconi@2x.gif"];
    UISegmentedControl *segement = [[UISegmentedControl alloc]initWithItems:@[@"消息",@"电话"]];
    segement.tintColor = kTintColorSegement;
    [segement addTarget:self action:@selector(segementValueChanged) forControlEvents:UIControlEventValueChanged];
    segement.selectedSegmentIndex = 0;
   
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:imageView];
    [self addSubview:segement];
    [self addSubview:rightBtn];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openDrawer:)];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:tapGr];
    
    imageView.sd_layout
    .widthIs(40)
    .heightIs(40)
    .leftSpaceToView(self,0)
    .topSpaceToView(self,0);
    
    segement.sd_layout
    .topSpaceToView(self,5)
    .leftSpaceToView(self,(self.bounds.size.width - 120) * 0.5)
    .widthIs(100)
    .heightIs(30);
    
    rightBtn.sd_layout
    .widthIs(20)
    .heightIs(20)
    .topEqualToView(segement)
    .rightSpaceToView(self,0);
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = imageView.frame.size.width * 0.5;
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.drawer hiddenHeadView:^(CGFloat alpha) {
        imageView.alpha = alpha;
    }];
}


#pragma mark scaleImg
-(UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

#pragma mark barBtnAction
- (void)openDrawer:(id)sender
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.drawer open];
}

- (void)segementValueChanged
{
    
}

- (void)clickAction
{
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
