//
//  MessageModel.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//


@implementation MessageModel
+ (instancetype)messageModelWithDict:(NSDictionary *)dict
{
    MessageModel *message = [[self alloc]init];
    message.text = dict[@"text"];
    message.time = dict[@"time"];
    message.type = [dict[@"type"] intValue];
    return message;
}
@end
