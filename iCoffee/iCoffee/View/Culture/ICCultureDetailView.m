//
//  ICCultureDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureDetailView.h"

@implementation ICCultureDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame delegate:delegate];
    
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, self.bounds.size.width, self.bounds.size.height - 32)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_contentLabel];
        
    
    }
    return self;
}

@end
