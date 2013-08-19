//
//  ICFavoriteView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFavoriteView.h"

@implementation ICFavoriteView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor magentaColor];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
