//
//  ICBeanDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailView.h"

@implementation ICBeanDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor purpleColor];
        
        _testLabel = [UILabel labelWithFrame:CGRectMake(0, 0, 150 ,44 ) text:@"Test View" alignment:NSTextAlignmentCenter];
        [self addSubview:_testLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
