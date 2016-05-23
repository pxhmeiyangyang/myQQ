//
//  ViewController.m
//  chat
//
//  Created by T_Yang on 15/9/2.
//  Copyright © 2015年 杨 天. All rights reserved.
//

#import "ViewController.h"
#import "ChatCell.h"
#import "ChatFrameModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) UITableView *tableView;
/**
 *  底部输入View
 */
@property (nonatomic, weak) YTInputView *inputView;

@end

@implementation ViewController
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        NSArray *data = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"]];
        NSMutableArray *tempArray = [NSMutableArray array];
        
        ChatModel *lastModel;
        for (NSDictionary *dic in data) {
            ChatFrameModel *chatFrameModel = [[ChatFrameModel alloc] init];
            ChatModel *chatModel = [ChatModel objectWithKeyValues:dic];
            //先赋值chatModel用于判断上一个model与这个model的时间是否一样 直接调用frame模型的set方法就晚了 没法hiddenTime设置成NO
            if ([chatModel.time isEqualToString:lastModel.time]) {
                chatModel.hiddenTime = YES;
            }else { 
                chatModel.hiddenTime = NO;
            }
            chatFrameModel.chatModel = chatModel;
            
            [tempArray addObject:chatFrameModel];
            
            lastModel = chatFrameModel.chatModel;
        }
        //一句话可将字典数组转换成模型数组
//        _dataArray = [ChatModel objectArrayWithKeyValuesArray:data];//tempArray;
        _dataArray = tempArray;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kColor(240, 240, 240);
    
    [self createTableView];
    
    [self createBottomView];
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kWidth, kHeight - 44 - 20)
                                                          style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView registerClass:[ChatCell class] forCellReuseIdentifier:@"ChatCell"];
    tableView.backgroundColor = kColor(240, 240, 240);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataArray.count - 1 inSection:0]
                          atScrollPosition:UITableViewScrollPositionBottom
                             animated:YES];
}

- (void)createBottomView {
    YTInputView *inputView = [[YTInputView alloc] initWithFrame:CGRectMake(0, kHeight - 44, kWidth, 44)];
    [self.view addSubview:inputView];
    self.inputView = inputView;
    inputView.delegate = self;
}

#pragma mark - UITableViewDelegate & DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataArray[indexPath.row] cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell" forIndexPath:indexPath];
    cell.frameModel = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - YTIputViewDelegate
- (void)inputView:(YTInputView *)inputView text:(NSString *)text {
    [self sendText:text type:@0];
    
    [self sendText:@"好的" type:@1];
}

- (void)inputView:(YTInputView *)inputView willShowKeyboardHeight:(CGFloat)height time:(NSNumber *)time {
    if (height == 0) return;
    [UIView animateWithDuration:0.25 animations:^{
        self.view.frame = CGRectMake(0, -height, kWidth, kHeight);
    }];
}

- (void)willHideKeyboardWithInputView:(YTInputView *)inputView time:(NSNumber *)time {
    [UIView animateWithDuration:[time doubleValue] animations:^{
        self.view.frame = CGRectMake(0, 0, kWidth, kHeight);
    }];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

/**
 *  模拟发送信息
 *
 *  @param text 要发送的消息
 */
- (void)sendText:(NSString *)text type:(NSNumber *)type {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    
    //模拟聊天
    ChatModel *chatModel = [[ChatModel alloc] init];
    chatModel.text = text;
    chatModel.time = [formatter stringFromDate:date];;
    chatModel.type = type;
    
    ChatModel *lastModel = [[self.dataArray lastObject] chatModel];
    if ([chatModel.text isEqualToString:lastModel.text]) {
        chatModel.hiddenTime = YES;
    }else {
        chatModel.hiddenTime = NO;
    }
    
    ChatFrameModel *frameModel = [[ChatFrameModel alloc] init];
    frameModel.chatModel = chatModel;
    
    [self.dataArray addObject:frameModel];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES];
}

/**
 *  模拟QQ上划一定程度后直接进入聊天状态
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.inputView isEditing] || scrollView.contentOffset.y - (scrollView.contentSize.height - kHeight) <= 200) return;
//    NSLog(@"%lf---%lf", scrollView.contentOffset.y, scrollView.contentSize.height - kHeight);
    [self.inputView becomeFirstResponder];
}

@end
