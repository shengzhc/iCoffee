//
//  ICBrewView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewView.h"

@implementation ICBrewView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
