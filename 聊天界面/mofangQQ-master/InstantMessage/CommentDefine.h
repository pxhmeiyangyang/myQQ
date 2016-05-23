//
//  CommentDefine.h
//  InstantMessage
//
//  Created by 林英伟 on 15/12/4.
//  Copyright © 2015年 林英伟. All rights reserved.
//

#ifndef CommentDefine_h
#define CommentDefine_h
#define NavigationColor ([UIColor colorWithRed:0.204 green:0.722 blue:0.918 alpha:1])
/**
 *  @brief  获取当前系统版本号
 */
#define kCurrentVersion      ([[[UIDevice currentDevice]systemVersion]floatValue])

#define ScreenH [[UIScreen mainScreen] bounds].size.height
#define ScreenW [[UIScreen mainScreen] bounds].size.width

#define kTintColorSegement     ([UIColor colorWithRed:0.831 green:0.941 blue:0.980 alpha:1])

#define kStatusBarH 20
#define kToolBarH 44
#define kTextFieldH 30

#define textPadding 15
#define timeH 40
#define iconW 40
#define iconH 40
#define textW 150
#endif /* CommentDefine_h */
