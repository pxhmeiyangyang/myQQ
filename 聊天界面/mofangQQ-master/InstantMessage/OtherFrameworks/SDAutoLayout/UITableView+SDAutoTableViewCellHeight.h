//
//  UITableView+SDAutoTableViewCellHeight.h
//  SDAutoLayout 测试 Demo
//
//  Created by nxl on 15/11/25.
//  Copyright © 2015年 nxl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSDModelCellTag 199206


@interface UITableViewCell (SDAutoHeight)

@property (nonatomic) CGFloat autoHeight;

@property (nonatomic) UIView *sd_bottomView;
@property (nonatomic) CGFloat sd_bottomViewBottomMargin;

- (void)setupAutoHeightWithBottomView:(UIView *)bottomView bottomMargin:(CGFloat)bottomMargin;

@end


@interface SDCellAutoHeightManager : NSObject

@property (nonatomic, assign) CGFloat contentViewWidth;

@property (nonatomic, assign) Class cellClass;

@property (nonatomic, assign) CGFloat cellHeight;

- (void)clearHeightCache;

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath model:(id)model keyPath:(NSString *)keyPath;

- (instancetype)initWithCellClass:(Class)cellClass;
+ (instancetype)managerWithCellClass:(Class)cellClass;
@end

@interface UITableView (SDAutoTableViewCellHeight)

- (void)startAutoCellHeightWithCellClass:(Class)cellClass contentViewWidth:(CGFloat)contentViewWidth;
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath model:(id)model keyPath:(NSString *)keyPath;
@property (nonatomic, strong) SDCellAutoHeightManager *cellAutoHeightManager;

@end

