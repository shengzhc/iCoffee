//
//  UIImageView+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/15/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICGeometry.h"

@interface UIImageView (ICServices)

+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName;

- (CGRect)alignedRectInSuperviewForImageWithOffset:(CGSize)offset
                                           options:(ICAlignmentOptions)options;

- (void)setImageViewBoundsToImage;

@end
