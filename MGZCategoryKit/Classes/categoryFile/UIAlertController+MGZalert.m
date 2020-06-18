//
//  UIAlertController+MGZalert.m
//  MGZModularization
//
//  Created by 马广召 on 2020/6/18.
//  Copyright © 2020 xiaoma. All rights reserved.
//

#import "UIAlertController+MGZalert.h"
#import <objc/message.h>
//#import <AppKit/AppKit.h>


@implementation UIAlertController (MGZalert)

//+(void)load{
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//    });
//    
//}

- (UILabel *)mgz_titleLabel{
    return [self mgz_viewArray:self.view][0];
}

- (UILabel *)mgz_messageLabel{
    return [self mgz_viewArray:self.view][1];
}


- (NSArray *)mgz_viewArray:(UIView *)rootView{
    
    static NSArray * _subviews = nil;
    _subviews = nil;
    for (UIView * v in rootView.subviews) {
        if (_subviews) {
            break;
        }
        if ([v isKindOfClass:[UILabel class]]) {
            _subviews = rootView.subviews;
            return _subviews;
        }
        [self mgz_viewArray:v];
    }
    return _subviews;
    
}

@end
