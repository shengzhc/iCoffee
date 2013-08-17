//
//  ICUView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICUView.h"

@implementation ICUView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.headerBarView = [[ICView alloc] initWithFrame:CGRectZero
                                                  delegate:delegate];
        
        self.contentView = [[ICView alloc] initWithFrame:CGRectZero
                                                delegate:delegate];
    
        self.bottomBarView = [[ICView alloc] initWithFrame:CGRectZero
                                                  delegate:delegate];
        
        [self addSubview:self.headerBarView];
        [self addSubview:self.contentView];
        [self addSubview:self.bottomBarView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
