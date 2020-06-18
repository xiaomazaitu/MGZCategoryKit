//
//  NSArray+MGZarray.m
//  MGZModularization
//
//  Created by 马广召 on 2020/6/18.
//  Copyright © 2020 xiaoma. All rights reserved.
//

#import "NSArray+MGZarray.h"
#import <objc/message.h>

//#import <AppKit/AppKit.h>


@implementation NSArray (MGZarray)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = NSClassFromString(@"__NSArrayI");
        Method oldMethod = class_getInstanceMethod(class, @selector(objectAtIndexedSubscript:));
        Method newMethod = class_getInstanceMethod(class, @selector(mgz_objectAtIndexedSubscript:));
        if (oldMethod&&newMethod) {
            method_exchangeImplementations(oldMethod, newMethod);
        }
        
    });
    
}

- (id)mgz_objectAtIndexedSubscript:(NSInteger)index{
    
    if (!self.count || self.count - 1 < index) {
        NSLog(@"objectAtIndexedSubscript越界");
        return nil;
    }else{
        id obj = [self mgz_objectAtIndexedSubscript:index];
        return obj;
    }
    
}

@end



//MutableArray

@implementation NSMutableArray (MGZarray)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = NSClassFromString(@"__NSArrayM");
        Method oldMethod = class_getInstanceMethod(class, @selector(objectAtIndexedSubscript:));
        Method newMethod = class_getInstanceMethod(class, @selector(mgz_objectAtIndexedSubscript:));
        if (oldMethod&&newMethod) {
            method_exchangeImplementations(oldMethod, newMethod);
        }
        
    });
    
}

- (id)mgz_objectAtIndexedSubscript:(NSUInteger)index{
    if(!self.count || self.count - 1 < index){
        NSLog(@"objectAtIndexedSubscript可变数组越界");
        return nil;
    }else{
        id obj = [self mgz_objectAtIndexedSubscript:index];
        return obj;
    }
    
    
}






@end
