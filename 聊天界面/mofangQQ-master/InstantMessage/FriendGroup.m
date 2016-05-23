//
//  FriendGroup.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/3.
//  Copyright © 2015年 林英伟. All rights reserved.
//



@implementation FriendGroup
+ (instancetype)friendGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (!self) {
        return self;
    }
    //给属性赋值(属性的名字与字典的key相同)
    [self setValuesForKeysWithDictionary:dict];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in _friends) {
        Friend *friend = [Friend friendWithDict:dict];
        [tempArray addObject:friend];
    }
    _friends = tempArray;
    return self;
}
@end
