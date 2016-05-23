//
//  Friend.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//



@interface Friend : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign,getter = isVip) BOOL vip;

+ (instancetype)friendWithDict:(NSDictionary*)dict;
- (instancetype)initWithDict:(NSDictionary*)dict;
@end
