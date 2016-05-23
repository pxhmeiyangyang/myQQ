//
//  ChatTableViewController.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import "ChatTableViewController.h"

@interface ChatTableViewController () <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *cellFrameDatas;
@property (nonatomic,strong) UIImageView *toolBar;
@property (nonatomic,strong) UITableView *chatView;
@end

@implementation ChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self loadData];
    
    [self addChatView];
    
    [self addToolBar];
    
    [self scrollToLast];
}

#pragma mark - keyboardAction
- (void)keyboardWillChange:(NSNotification*)note
{
    NSLog(@"%@",note.userInfo);
    NSDictionary *userInfo = note.userInfo;
    CGFloat duration = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    CGRect keyFrame = [userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat moveY = keyFrame.origin.y - self.view.frame.size.height - kToolBarH - kStatusBarH;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, moveY);
    }];
}

#pragma mark loadData
- (void)loadData
{
    self.cellFrameDatas = [NSMutableArray array];
    NSURL *dataUrl = [[NSBundle mainBundle] URLForResource:@"messages.plist" withExtension:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfURL:dataUrl];
    for (NSDictionary *dict in dataArray) {
        //创建model并赋值
        MessageModel *message = [MessageModel messageModelWithDict:dict];
        //取最后一条数据
        CellFrameModel *lastFrame = [self.cellFrameDatas lastObject];
        //创建frameModel
        CellFrameModel *cellFrame = [[CellFrameModel alloc]init];
        //展示时间  当前时间跟最后一条相同就不展示时间
        message.showTime = ![message.time isEqualToString:lastFrame.message.time];
        //setting方法重写
        cellFrame.message = message;
        [_cellFrameDatas addObject:cellFrame];
    }
}

#pragma mark tapGesture
- (void)addChatView
{
    self.view.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1.0];
    UITableView *chatView = [[UITableView alloc]init];
    chatView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kToolBarH - kToolBarH - kStatusBarH);
    chatView.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1.0];
    chatView.delegate = self;
    chatView.dataSource = self;
    chatView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置tableView可不可以选中
    chatView.allowsSelection = NO;
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endEdit)];
    self.chatView = chatView;
    [self.view addGestureRecognizer:tapGr];
    [self.view addSubview:chatView];
}

- (void)endEdit
{
    [self.view endEditing:YES];
}

#pragma mark toolBar
- (void)addToolBar
{
    //工具条
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.frame = CGRectMake(0, ScreenH - kToolBarH - kToolBarH - kStatusBarH, self.view.frame.size.width, kToolBarH);
    bgView.image = [UIImage imageNamed:@"chat_bottom_bg"];
    bgView.userInteractionEnabled = YES;
    self.toolBar = bgView;
    [self.view addSubview:bgView];
    //语音按钮
    UIButton *sendSoundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self initView:bgView BtnWith:sendSoundBtn frame:CGRectMake(0, 0, kToolBarH, kToolBarH) imageName:@"chat_bottom_voice_nor"];
    //更多按钮
    UIButton *addMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self initView:bgView BtnWith:addMoreBtn frame:CGRectMake(self.view.frame.size.width - kToolBarH, 0, kToolBarH, kToolBarH) imageName:@"chat_bottom_up_nor"];
    //表情按钮
    UIButton *emotionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self initView:bgView BtnWith:emotionBtn frame:CGRectMake(self.view.frame.size.width - kToolBarH * 2, 0, kToolBarH, kToolBarH) imageName:@"chat_bottom_smile_nor"];
    
    //输入框
    UITextField *textField = [[UITextField alloc]init];
    //发送样式
    textField.returnKeyType = UIReturnKeySend;
    //没有文字为disabled
    textField.enablesReturnKeyAutomatically = YES;
    //左侧加图片
    textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 1)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.frame = CGRectMake(kToolBarH, (kToolBarH - kTextFieldH) * 0.5, self.view.frame.size.width - 3 * kToolBarH, kTextFieldH);
    textField.background = [UIImage imageNamed:@"chat_bottom_textfield"];
    textField.delegate = self;
    [bgView addSubview:textField];
}

- (void)initView:(UIView*)view BtnWith:(UIButton*)btn frame:(CGRect)frame imageName:(NSString*)imageName
{
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [view addSubview:btn];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellFrameDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.cellFrame = self.cellFrameDatas[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellFrameModel *cellFrame = self.cellFrameDatas[indexPath.row];
    return cellFrame.cellHeight;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - textFieldDelegate
//编辑完成
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //1.获得时间
    NSDate *sendDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *locationStr = [dateFormatter stringFromDate:sendDate];
    
    //2.创建一个MessageModel类 聊天内容数据
    MessageModel *message = [[MessageModel alloc]init];
    message.text = textField.text;
    message.time = locationStr;
    message.type = 0;
    
    CellFrameModel *cellFrame = [[CellFrameModel alloc]init];
    CellFrameModel *lastCellFrame = [self.cellFrameDatas lastObject];
    //最后一条时间和现在相同就不显示时间
    message.showTime = ![lastCellFrame.message.time isEqualToString:message.time];
    cellFrame.message = message;
    
    //加到数组里,刷新数据
    [self.cellFrameDatas addObject:cellFrame];
    [self.chatView reloadData];
    
    [self scrollToLast];
    //输入框置空
    textField.text = @"";
    
    return YES;
}

#pragma mark scrollTheLastRow
- (void)scrollToLast
{
    //滚到最后一行
    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.cellFrameDatas.count - 1 inSection:0];
    [self.chatView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

#pragma mark statusBarHidden
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
