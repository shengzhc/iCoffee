//
//  UIView+Transition.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIView+Transition.h"

@implementation UIView (Transition)

+ (void)fadeFromView:(UIView *)view
              toView:(UIView *)toView
{
    [self fadeFromView:view
                toView:toView
              animtion:nil
            completion:nil];
}


+ (void)fadeFromView:(UIView *)view
              toView:(UIView *)toView
            animtion:(void (^)(void))animation
          completion:(void (^)(BOOL))completion
{
    if (!view && !toView)
    {
        return;
    }
    
    [UIView animateWithDuration:view ? 0.35 : 0
                     animations:^
     {
         if (view)
         {
             view.alpha = 0;
         }
         
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:0.5 animations:^
          {
              if (toView)
              {
                  toView.alpha = 1;
              }
              
              if (animation)
              {
                  animation();
              }
          }
                          completion:^(BOOL finished)
          {

              if (completion)
              {
                  completion(finished);
              }
          }];
     }];
}

@end
