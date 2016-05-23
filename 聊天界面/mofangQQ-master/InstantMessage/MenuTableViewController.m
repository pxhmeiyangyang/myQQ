//
//  MenuTableViewController.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/8.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import "MenuTableViewController.h"
#import "AppDelegate.h"

@interface MenuTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *menuImgs;
@property (nonatomic,strong) NSArray *menuTitles;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MenuHeaderView *menuHeaderView;
@property (nonatomic,strong) MenuFooterView *menuFooterView;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initHeadView];
    [self initBottomView];
    [self initTableView];
}

- (void)initData
{
    //模拟数据
    self.menuImgs = @[@"118",@"110",@"117",@"119",@"112",@"111"];
    self.menuTitles = @[@"我的QQ会员",@"QQ钱包",@"个性装扮",@"我的收藏",@"我的相册",@"我的文件"];
    self.personalInfor = [[PersonalInfor alloc]init];
    self.personalInfor.imageStr = @"niconiconi@2x.gif";
    self.personalInfor.name = @"key君的幸福理论";
    self.personalInfor.sign = @"版权所有,仿冒必究";
}

- (void)initHeadView
{
    MenuHeaderView *menuHeaderView = [[MenuHeaderView alloc]initWithFrame:CGRectMake(0, kToolBarH, self.view.frame.size.width - 20, 130)];
    menuHeaderView.personalInfor = self.personalInfor;
    self.menuHeaderView = menuHeaderView;
    [self.view addSubview:menuHeaderView];
}

- (void)initTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.menuHeaderView.frame), self.view.frame.size.width, self.view.frame.size.height - self.menuHeaderView.frame.size.height - self.menuFooterView.frame.size.height - kToolBarH)];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

- (void)initBottomView
{
    MenuFooterView *menuFooterView = [[MenuFooterView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 80, self.view.frame.size.width, 80)];
    self.menuFooterView = menuFooterView;
    [self.view addSubview:menuFooterView];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuImgs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.menuTitles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.menuImgs[indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
