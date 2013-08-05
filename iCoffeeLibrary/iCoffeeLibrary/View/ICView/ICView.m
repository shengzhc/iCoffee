//
//  ICView.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@implementation ICView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame];

    if (self)
    {
        self.delegate = delegate;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
