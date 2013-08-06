//
//  UIView+Transition.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Transition)

+ (void)fadeFromView:(UIView *)view
              toView:(UIView *)toView;

+ (void)fadeFromView:(UIView *)view
              toView:(UIView *)toView
            animtion:(void (^)(void))animation
          completion:(void (^)(BOOL))completion;

@end
