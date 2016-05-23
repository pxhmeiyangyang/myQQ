//
//  HeaderView.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//

typedef void (^reloadDataBlock) ();
@interface HeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) FriendGroup *FriendGroup;
- (void)reloadData:(reloadDataBlock)block;
+ (instancetype)headViewWithTableView:(UITableView*)tableView;
@end
