//
//  CellFrameModel.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//



@interface CellFrameModel : NSObject
@property (nonatomic,strong) MessageModel *message;
@property (nonatomic,assign,readonly) CGRect timeFrame;
@property (nonatomic,assign,readonly) CGRect iconFrame;
@property (nonatomic,assign,readonly) CGRect textFrame;
@property (nonatomic,assign,readonly) CGFloat cellHeight;
@end
