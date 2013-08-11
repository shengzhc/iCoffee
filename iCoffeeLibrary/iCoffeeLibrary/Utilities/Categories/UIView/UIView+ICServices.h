//
//  UIView+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICGeometry.h"

@interface UIView (ICServices)

- (CGRect)alignedRectInSuperviewForSize:(CGSize)size
                                 offset:(CGSize)offset
                                options:(ICAlignmentOptions)options;

- (NSUInteger)horizontalEnding;
- (NSUInteger)verticalEnding;

- (UIImage *)snapshotImage;

- (void)darken:(CGFloat)darkenValue;

+ (UIWindow *)mainWindow;
- (NSNumber *)diagnoalRadius;

- (void)centerInParentHorizontally;
- (void)centerInParentVertically;
- (void)centerInParent;


- (CGPoint)pointInScreenWithPoint:(CGPoint)point;
- (CGRect)rectInScreenCoordinate;


@end
