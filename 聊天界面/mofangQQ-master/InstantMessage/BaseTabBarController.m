//
//  BaseTabBarController.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/3.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import "BaseTabBarController.h"
#import "MessageTableViewController.h"
#import "MessageNaviViewController.h"
#import "ConnectingTableViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildControllers];
}

- (void)setupChildControllers
{
    [self setupChildNavigationControllerWithClass:[MessageNaviViewController class] tabBarImageName:@"tab_recent" rootViewControllerClass: [MessageTableViewController class] rootViewControllerTitle:@"消息"];
    
    [self setupChildNavigationControllerWithClass:[MessageNaviViewController class] tabBarImageName:@"tab_buddy" rootViewControllerClass: [ConnectingTableViewController class] rootViewControllerTitle:@"联系人"];
}

- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = [UIImage imageNamed:name];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_press", name]];
    [self addChildViewController:navVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
