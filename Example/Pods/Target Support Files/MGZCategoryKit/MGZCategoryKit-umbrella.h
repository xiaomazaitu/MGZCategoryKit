#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+MGZarray.h"
#import "NSString+MGZstring.h"
#import "UIAlertController+MGZalert.h"

FOUNDATION_EXPORT double MGZCategoryKitVersionNumber;
FOUNDATION_EXPORT const unsigned char MGZCategoryKitVersionString[];

