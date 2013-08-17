//
//  ICWelcomeView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICWelcomeView.h"

@implementation ICWelcomeView


- (id)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end
