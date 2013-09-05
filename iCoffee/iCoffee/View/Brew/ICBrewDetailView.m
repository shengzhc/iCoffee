//
//  ICBrewDetailView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewDetailView.h"

@implementation ICBrewDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame delegate:delegate];
    
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
