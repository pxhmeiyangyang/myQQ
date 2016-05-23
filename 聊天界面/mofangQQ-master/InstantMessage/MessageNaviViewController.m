//
//  MessageNaviViewController.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/3.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import "MessageNaviViewController.h"

@interface MessageNaviViewController ()

@end

@implementation MessageNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self SetupNavStyle];
    
}

-(void)SetupNavStyle
{
    UIColor *BkColor = NavigationColor;
    if (kCurrentVersion < 7.0f)
    {
        [self.navigationBar setBackgroundImage:[[MessageNaviViewController CreateImageWithColor:BkColor] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)] forBarMetrics:UIBarMetricsDefault];
        if (kCurrentVersion > 6.f)
        {
            //去掉导航栏下边的投影
            self.navigationBar.shadowImage = [[MessageNaviViewController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
        }
    }else
    {
        [self.navigationBar setBackgroundImage:[[MessageNaviViewController CreateImageWithColor:BkColor] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 1, 5, 1)] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.tintColor = [UIColor whiteColor];
        //去掉导航栏下边的投影
        self.navigationBar.shadowImage = [[MessageNaviViewController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    }
    self.navigationBar.barStyle = UIBarStyleBlack;
}

+ (UIImage *)CreateImageWithColor: (UIColor *) color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
