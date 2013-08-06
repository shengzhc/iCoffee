//
//  KP.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/11/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "ICGeometry.h"


////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Geometric Alignment
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

CGRect ICSizeAlignInFrame(CGSize size, CGRect frame, CGSize offset, ICAlignmentOptions options)
{
    CGFloat xOrigin, yOrigin;
    
    if (options & ICAlignmentOptionsLeft)
    {
        xOrigin = 0 + offset.width;
    }
    else if (options & ICAlignmentOptionsRight)
    {
        xOrigin = frame.size.width - size.width - offset.width;
    }
    else if (options & ICAlignmentOptionsHorizontalCenter)
    {
        xOrigin = (frame.size.width - size.width)/2.0;
    }
    else
    {
        xOrigin = 0 + offset.width;
    }
    
    if (options & ICAlignmentOptionsTop)
    {
        yOrigin = 0 + offset.height;
    }
    else if (options & ICAlignmentOptionsBottom)
    {
        yOrigin = frame.size.height - size.height - offset.height;
    }
    else if (options & ICAlignmentOptionsVerticalCenter)
    {
        yOrigin = (frame.size.height - size.height)/2.0;
    }
    else
    {
        yOrigin = 0 + offset.height;
    }
    
    return ICRectMake(xOrigin, yOrigin,
                      size.width, size.height);
}

CGRect ICRectAlignInFrame(CGRect rect, CGRect frame, CGSize offset, ICAlignmentOptions options)
{
    return ICSizeAlignInFrame(rect.size, frame, offset, options);
}

CGFloat ICAlignmentCoordinateWithRelativeFrameHorizontal(CGRect frame, CGFloat padding, ICAlignmentOptions options)
{
    if (options & ICAlignmentOptionsLeft)
    {
        return frame.origin.x - padding;
    }
    else if (options & ICAlignmentOptionsRight)
    {
        return frame.origin.x + frame.size.width + padding;
    }
    
    return frame.origin.x + frame.size.width + padding;
}

CGFloat ICAlignmentCoordinateWithRelativeFrameVertical(CGRect frame, CGFloat padding, ICAlignmentOptions options)
{
    if (options & ICAlignmentOptionsTop)
    {
        return frame.origin.y - padding;
    }
    else if (options & ICAlignmentOptionsBottom)
    {
        return frame.origin.y + frame.size.height + padding;
    }
    
    return frame.origin.y + frame.size.height + padding;
}

CGRect ICRectWithOriginAndSize(CGPoint origin, CGSize size)
{
    return ICRectMake(origin.x, origin.y, size.width, size.height);
}

CGRect ICRectWithOriginAndSizeParameters(CGPoint origin, CGFloat width, CGFloat height)
{
    return ICRectMake(origin.x, origin.y, width, height);
}

CGRect ICRectWithOriginCoordinatesAndSize(CGFloat x, CGFloat y, CGSize size)
{
    return ICRectMake(x, y, size.width, size.height);
}

CGRect ICBooundsWithSize(CGSize size)
{
    return ICRectMake(0, 0, size.width, size.height);
}

CGRect ICBoundsWithSizeParameters(CGFloat width, CGFloat height)
{
    return ICRectMake(0, 0, width, height);
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Geometric Construction
////////////////////////////////////////////////////////////////////////////////////////////////////////////

CGRect KPBoundsMake(CGFloat width, CGFloat height)
{
    return ICBoundsWithSizeParameters(width, height);
}

CGPoint ICFrameMidPoint(CGRect frame)
{
    return ICPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
}

CGPoint ICPointMake(CGFloat x, CGFloat y)
{
    return CGPointMake(x, y);
}

CGSize ICSizeMake(CGFloat width, CGFloat height)
{
    return CGSizeMake(width, height);
}

CGRect ICRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    return CGRectMake(x, y, width, height);
}

CGRect ICRectOffset(CGRect rect, CGFloat x, CGFloat y)
{
    return ICRectMake(rect.origin.x + x, rect.origin.y + y,
                      rect.size.width, rect.size.height);
}

CGRect ICRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
    return CGRectInset(rect, dx, dy);
}

