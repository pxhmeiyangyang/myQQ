//
//  CustomSearchVC.m
//  myQQ
//
//  Created by pxh on 16/5/25.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "CustomSearchVC.h"

@interface CustomSearchVC ()

@property(nonatomic,strong)UIView* navBar;

@end

@implementation CustomSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.navBar];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(UIView *)navBar{
    if (!_navBar) {
        _navBar                 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        CGFloat ratio           = 51.0/255;
        _navBar.backgroundColor = [UIColor colorWithRed:ratio green:ratio blue:ratio alpha:1.0];
        //标题
        UILabel* label          = [[UILabel alloc]initWithFrame:CGRectMake(80, 25, SCREEN_WIDTH - 160, 25)];
        label.textColor         = [UIColor whiteColor];
        label.font              = [UIFont systemFontOfSize:18];
        label.textAlignment     = NSTextAlignmentCenter;
        label.text              = @"关注";
        [_navBar addSubview:label];
        //返回按钮
        UIButton* backBtn       = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backBtn setFrame:CGRectMake(20, 25, 40, 30)];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [_navBar addSubview:backBtn];
    }
    return _navBar;
}

-(void)back{
    __weak typeof (self)weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:nil];
    self.searchBar.text = @"";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([weakSelf.delegateCustomSearch respondsToSelector:@selector(searchControllerBackButtonClick:)]) {
            [weakSelf.delegateCustomSearch searchControllerBackButtonClick:weakSelf];
        }
    });
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
