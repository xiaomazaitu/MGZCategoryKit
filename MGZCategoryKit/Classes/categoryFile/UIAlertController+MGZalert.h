//
//  UIAlertController+MGZalert.h
//  MGZModularization
//
//  Created by 马广召 on 2020/6/18.
//  Copyright © 2020 xiaoma. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (MGZalert)

@property (nonatomic, strong)UILabel * mgz_titleLabel;

@property (nonatomic, strong)UILabel * mgz_messageLabel;

@end

NS_ASSUME_NONNULL_END
