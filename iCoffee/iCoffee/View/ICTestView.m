//
//  ICTestView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICTestView.h"
#import "UIView+ICServices.h"

@implementation ICTestView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        ICView *v = [[ICView alloc] initWithFrame:CGRectZero delegate:self];
        [self addSubview:v];
        v.frame = [v alignedRectInSuperviewForSize:CGSizeZero offset:CGSizeZero options:ICAlignmentOptionsLeft];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
