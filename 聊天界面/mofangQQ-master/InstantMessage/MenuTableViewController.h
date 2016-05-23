//
//  MenuTableViewController.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/8.
//  Copyright © 2015年 林英伟. All rights reserved.
//



@interface MenuTableViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>
@property (nonatomic,weak) ICSDrawerController *drawer;
@property (nonatomic,strong) PersonalInfor *personalInfor;
@end
