//
//  LinkManVC.m
//  myQQ
//
//  Created by pxh on 16/5/23.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "LinkManVC.h"

@interface LinkManVC ()<UITableViewDelegate,UITableViewDataSource>

//页面标示图
@property(nonatomic,strong)UITableView* tableview;


@end

@implementation LinkManVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title = @"联系人";
    
    [self.view addSubview:self.tableview];
}

#pragma mark - 懒加载 初始化
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview            = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.delegate   = self;
    }
    return _tableview;
}

#pragma mark - tableview delagete

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - tableview datasourse

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
