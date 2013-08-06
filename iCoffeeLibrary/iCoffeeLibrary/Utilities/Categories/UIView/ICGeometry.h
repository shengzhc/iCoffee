//
//  KP.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/11/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#ifndef __ICGEOMETRY_H_
#define __ICGEOMETRY_H_

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>

typedef enum
{
    ICAlignmentOptionsLeft          = 1 << 0,
    ICAlignmentOptionsRight         = 1 << 1,
    ICAlignmentOptionsTop           = 1 << 2,
    ICAlignmentOptionsBottom        = 1 << 3,
    ICAlignmentOptionsHorizontalCenter = 1 << 4,
    ICAlignmentOptionsVerticalCenter    = 1 << 5
} ICAlignmentOptions;

CGRect ICSizeAlignInFrame(CGSize size, CGRect frame, CGSize offset, ICAlignmentOptions options);
CGRect ICRectAlignInFrame(CGRect rect, CGRect frame, CGSize offset, ICAlignmentOptions options);
CGFloat ICAlignmentCoordinateWithRelativeFrameHorizontal(CGRect frame, CGFloat padding, ICAlignmentOptions options);
CGFloat ICAlignmentCoordinateWithRelativeFrameVertical(CGRect frame, CGFloat padding, ICAlignmentOptions options);
CGRect ICRectWithOriginAndSize(CGPoint origin, CGSize size);
CGRect ICRectWithOriginAndSizeParameters(CGPoint origin, CGFloat width, CGFloat height);
CGRect ICRectWithOriginCoordinatesAndSize(CGFloat x, CGFloat y, CGSize size);
CGRect ICBooundsWithSize(CGSize size);
CGRect ICBoundsWithSizeParameters(CGFloat width, CGFloat height);

CGRect KPBoundsMake(CGFloat width, CGFloat height);
CGPoint ICFrameMidPoint(CGRect frame);
CGPoint ICPointMake(CGFloat x, CGFloat y);
CGSize ICSizeMake(CGFloat width, CGFloat height);
CGRect ICRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGRect ICRectOffset(CGRect rect, CGFloat x, CGFloat y);
CGRect ICRectInset(CGRect rect, CGFloat dx, CGFloat dy);


#endif