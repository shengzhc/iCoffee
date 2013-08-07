//
//  UIScreen+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (ICServices)

+ (BOOL)isRetina;
+ (CGFloat)screenHeigth;
+ (CGFloat)screenWidth;
+ (CGFloat)statusBarHeight;
+ (CGPoint)screenCenter;

@end
