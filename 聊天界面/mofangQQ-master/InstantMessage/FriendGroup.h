//
//  FriendGroup.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/3.
//  Copyright © 2015年 林英伟. All rights reserved.
//



@interface FriendGroup : NSObject
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger online;
@property (nonatomic,assign,getter = isOpened) BOOL opened;

+ (instancetype)friendGroupWithDict:(NSDictionary*)dict;
- (instancetype)initWithDict:(NSDictionary*)dict;
@end
