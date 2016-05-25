//
//  CustomSearchVC.h
//  myQQ
//
//  Created by pxh on 16/5/25.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSearchVCDelegate <NSObject,UISearchBarDelegate>

@required

-(void)searchControllerBackButtonClick:(UISearchController* )searchController;

@end

@interface CustomSearchVC : UISearchController

@property(nonatomic,assign)id<CustomSearchVCDelegate>delegateCustomSearch;

@end
