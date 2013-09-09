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
        self.backgroundColor = [UIColor clearColor];
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, width, 50)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithSize:20];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,_titleLabel.verticalEnding + 15, width, height - 32 - _titleLabel.verticalEnding)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:_titleLabel];
        [self addSubview:_contentLabel];
        
    
    }
    
    return self;
}

@end
