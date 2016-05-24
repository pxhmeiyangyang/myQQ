//
//  UIView+Common.m
//  myQQ
//
//  Created by pxh on 16/5/24.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

/**
 *  获取视图左上角的横坐标
 *
 *  @return 坐标值
 */
-(CGFloat)left{
    return self.frame.origin.x;
}

/**
 *  获取视图左上角的纵坐标
 *
 *  @return 坐标值
 */
-(CGFloat)top{
    return self.frame.origin.y;
}

/**
 *  获取视图右下角的横坐标
 *
 *  @return 坐标值
 */
-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

/**
 *  获取视图右下角的纵坐标
 *
 *  @return 坐标值
 */
-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

/**
 *  获取视图宽度
 *
 *  @return 宽度值
 */
-(CGFloat)width{
    return self.frame.size.width;
}

/**
 *  获取视图的高度值
 *
 *  @return 高度值
 */
-(CGFloat)height{
    return self.frame.size.height;
}

/**
 *  @brief 删除所有子视图
 */
-(void)removeAllSubviews{
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

/**
 *  快速修改对象的单个属性值
 *
 *  @param key   要修改的view、imageview、button.....
 *  @param key   要修改的属性，例如：@"x",@"y",@"w",@"h"
 *  @param value 被修改的新值
 */
-(void)frameSet:(NSString* )key value:(CGFloat)value{
    CGRect rect = self.frame;
    
    if ([@"x" isEqualToString:key]) {
        rect.origin.x = value;
    }else if ([@"y" isEqualToString:key]){
        rect.origin.y = value;
    }else if ([@"w" isEqualToString:key]){
        rect.size.width = value;
    }else if ([@"h" isEqualToString:key]){
        rect.size.height = value;
    }
    
    self.frame = rect;
}

/**
 *  快速修改对象的多个属性值
 *
 *  @param key   要修改的view、imageview、button.....
 *  @param key1   要修改的属性1，例如：@"x",@"y",@"w",@"h"
 *  @param value1 属性1的新值
 *  @param key2   要修改的属性2，例如：@"x",@"y",@"w",@"h"
 *  @param value2 属性2的新值
 */
-(void)frameSet:(NSString *)key1 value1:(CGFloat)value1 key2:(NSString *)key2 value2:(CGFloat)value2{
    [self frameSet:key1 value:value1];
    [self frameSet:key2 value:value2];
}

/**
 *  从bundle的xib文件中加载view
 *
 *  @return 返回加载完成的view
 */
+(instancetype)viewFormXibBundle{
    id object = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]objectAtIndex:0];
    if ([object isKindOfClass:[self class]]) {
        return object;
    }
    return nil;
}

@end
