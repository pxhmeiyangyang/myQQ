//
//  MessageModel.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//


typedef enum{
    kMessageModelTypeOther,
    kMessageModelTypeMe
} MessageModelType;

@interface MessageModel : NSObject
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) MessageModelType type;
@property (nonatomic,assign) BOOL showTime;

+ (instancetype)messageModelWithDict:(NSDictionary *)dict;
@end
