//
//  ConnectingTableViewController.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/3.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import "ConnectingTableViewController.h"
#import "ChatTableViewController.h"

@interface ConnectingTableViewController ()
@property (nonatomic,strong) NSArray *friendsData;
@end

@implementation ConnectingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

#pragma mark lodaData
- (void)loadData
{
    self.tableView.sectionHeaderHeight = 40;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"friends.plist" withExtension:nil];
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
    NSMutableArray *fgArray = [NSMutableArray array];
    //遍历plist文件
    for (NSDictionary *dict in tempArray) {
        FriendGroup *fg = [FriendGroup friendGroupWithDict:dict];
        [fgArray addObject:fg];
    }
    self.friendsData = fgArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.friendsData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FriendGroup *fg = self.friendsData[section];
    //根据是否打开决定显示好友数量
    NSInteger count = fg.isOpened ? fg.friends.count : 0;
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    FriendGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[FriendGroupCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //好友组
    FriendGroup *fg = self.friendsData[indexPath.section];
    //好友
    Friend *friend = fg.friends[indexPath.row];
    
    cell.friends = friend;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *hv = [HeaderView headViewWithTableView:tableView];
    [hv reloadData:^{
        [self.tableView reloadData];
    }];
    hv.FriendGroup = self.friendsData[section];
    return hv;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewController *cv = [[ChatTableViewController alloc]init];
    [self.navigationController pushViewController:cv animated:YES];
}
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
