//
//  YTInputView.m
//  chat
//
//  Created by T_Yang on 15/9/2.
//  Copyright © 2015年 杨 天. All rights reserved.
//

#import "YTInputView.h"

@interface YTInputView ()
@property (nonatomic, weak) UITextField *textField;
@end

@implementation YTInputView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"chat_bottom_bg"];
        
        UIButton *soundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:soundBtn];
        [soundBtn setImage:[UIImage imageNamed:@"chat_bottom_voice_nor"] forState:UIControlStateNormal];
        [soundBtn setImage:[UIImage imageNamed:@"chat_bottom_voice_press"] forState:UIControlStateHighlighted];
        soundBtn.frame = CGRectMake(0, 0, 44, 44);
        
        UIImageView *textFieldBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(soundBtn.frame),
                                                                               0,
                                                                               kWidth - 3 * 44 - 5,
                                                                               30)];
        [self addSubview:textFieldBackImageView];
        textFieldBackImageView.userInteractionEnabled = YES;
        textFieldBackImageView.center = CGPointMake(textFieldBackImageView.center.x, self.frame.size.height / 2);
        textFieldBackImageView.image = [UIImage imageNamed:@"chat_bottom_textfield"];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0,
                                                                               0,
                                                                               textFieldBackImageView.frame.size.width - 10,
                                                                               textFieldBackImageView.frame.size.height - 10)];
        [textFieldBackImageView addSubview:textField];
        self.textField = textField;
        textField.center = CGPointMake(textFieldBackImageView.frame.size.width / 2,
                                       textFieldBackImageView.frame.size.height / 2);
        textField.returnKeyType = UIReturnKeySend;
        //当输入框没有内容的时候 return键自动设置位不能点击的状态
        textField.enablesReturnKeyAutomatically = YES;
        textField.delegate = self;
        
        NSArray *titleArray = @[@"chat_bottom_up", @"chat_bottom_smile"];
        for (int i = 0; i < 2; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:btn];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_nor", titleArray[i]]]
                 forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_press", titleArray[i]]]
                 forState:UIControlStateHighlighted];
            btn.frame = CGRectMake(kWidth - (i + 1) * 44, 0, 44, 44);
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    return self;
}

/**
 *  是否在输入状态
 */
- (BOOL)isEditing {
    return [self.textField isFirstResponder];
}

- (BOOL)becomeFirstResponder {
    return [self.textField becomeFirstResponder];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if ([_delegate respondsToSelector:@selector(inputView:willShowKeyboardHeight:time:)]) {
        [_delegate inputView:self
      willShowKeyboardHeight:keyboardRect.size.height
                        time:[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    if ([_delegate respondsToSelector:@selector(willHideKeyboardWithInputView:time:)]) {
        [_delegate willHideKeyboardWithInputView:self
                                            time:[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([_delegate respondsToSelector:@selector(inputView:text:)]) {
        [_delegate inputView:self text:textField.text];
    }
    return YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
