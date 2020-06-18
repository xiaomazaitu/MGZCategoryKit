//
//  NSString+MGZstring.m
//  MGZModularization
//
//  Created by 马广召 on 2020/6/18.
//  Copyright © 2020 xiaoma. All rights reserved.
//

#import "NSString+MGZstring.h"
#import <objc/message.h>
//#import <AppKit/AppKit.h>


@implementation NSString (MGZstring)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSCFString");
        Method oldMethod = class_getInstanceMethod(class, @selector(substringFromIndex:));
        Method newMethod = class_getInstanceMethod(class, @selector(mgz_substringFromIndex:));
        if (oldMethod&&newMethod) {
            method_exchangeImplementations(oldMethod, newMethod);
        }
        
        
        Method oldM = class_getInstanceMethod(class, @selector(substringToIndex:));
        Method newM = class_getInstanceMethod(class, @selector(mgz_substringToIndex:));
        if (oldM&&newM) {
            method_exchangeImplementations(oldM, newM);
        }
        
    });
    
}


- (NSString *)mgz_substringFromIndex:(NSUInteger)from{
    if (self.length < from) {
        NSLog(@"字符串substringFromIndex方法越界");
        return @"";
    }else{
        return [self mgz_substringFromIndex:from];
    }
}

- (NSString *)mgz_substringToIndex:(NSUInteger)to{
    if(self.length < to){
        NSLog(@"字符串substringToIndex方法越界");
        return @"";
    }else{
        return [self mgz_substringFromIndex:to];
    }
}

@end
