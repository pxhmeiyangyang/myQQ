//
//  BaseTabBarController.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/3.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController<ICSDrawerControllerPresenting,ICSDrawerControllerChild>
@property (nonatomic,weak) ICSDrawerController *drawer;
@end
