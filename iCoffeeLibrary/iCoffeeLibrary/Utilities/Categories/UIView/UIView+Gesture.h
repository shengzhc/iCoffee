//
//  UIView+GestureServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gesture) < UIGestureRecognizerDelegate >

- (void)addClickGesture:(SEL)selector
                 target:(id)target;

- (void)addClickGesture:(SEL)selector
                 target:(id)target
               delegate:(id < UIGestureRecognizerDelegate> )delegate;

@end
