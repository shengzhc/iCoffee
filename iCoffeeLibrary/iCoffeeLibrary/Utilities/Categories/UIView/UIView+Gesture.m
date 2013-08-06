//
//  UIView+GestureServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)

- (void)addClickGesture:(SEL)selector
                 target:(id)target
{
    [self addClickGesture:selector
                   target:target
                 delegate:nil];
}

- (void)addClickGesture:(SEL)selector
                 target:(id)target
               delegate:(id < UIGestureRecognizerDelegate >)delegate
{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target
                                                                                           action:selector];
    [tapGestureRecognizer setNumberOfTouchesRequired:1];
    tapGestureRecognizer.delegate = delegate;
    [self addGestureRecognizer:tapGestureRecognizer];
}
@end
