//
//  ICCultureDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureDetailView.h"
#import <QuartzCore/QuartzCore.h>


#define HORIZONALFFSET 10
#define VERTICALOFFSET 15

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
        
        _backgroundView = [[ICView alloc] initWithFrame:CGRectMake(HORIZONALFFSET, VERTICALOFFSET, width - HORIZONALFFSET*2, height-32-44-VERTICALOFFSET*2)];
        _backgroundView.layer.cornerRadius = 10.0f;
        _backgroundView.layer.borderWidth = 1.0f;
        _backgroundView.clipsToBounds = YES;
        
        width = CGRectGetWidth(_backgroundView.bounds);
        height = CGRectGetHeight(_backgroundView.bounds);
                
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(HORIZONALFFSET, 10, width - HORIZONALFFSET*2 , 50)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithSize:25];
        
        _contentField = [[UITextView alloc] initWithFrame:CGRectMake(HORIZONALFFSET, _titleLabel.verticalEnding + VERTICALOFFSET, width - HORIZONALFFSET*2, height- _titleLabel.verticalEnding - VERTICALOFFSET*2)];
        _contentField.userInteractionEnabled = NO;
        _contentField.font = [UIFont fontWithSize:14];
        
        [self addSubview:_backgroundView];
        [_backgroundView addSubview:_titleLabel];
        [_backgroundView addSubview:_contentField];
    }
    
    return self;
}

@end
