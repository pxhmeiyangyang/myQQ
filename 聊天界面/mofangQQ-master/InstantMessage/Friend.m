//
//  Friend.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//



@implementation Friend
+ (instancetype)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (!self) {
        return self;
    }
    //dict里面的value赋值给自己的属性(vip,icon,intro,name) 前提是dict的key跟属性名称相同
    [self setValuesForKeysWithDictionary:dict];
    return self;
}
@end
