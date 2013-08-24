//
//  ICPopButtonView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButtonView.h"

@implementation ICPopButtonView

- (id)initWithFrame:(CGRect)frame
        delegate:(id)delegate
{
    self = [super initWithFrame:frame delegate:delegate];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];

        UIImage *image = [UIImage imageNamed:@"bg-addbutton.png"];
        _mainButton = [[ICPopButtonItem alloc] initWithImage:image];
        [_mainButton sizeToFit];
        [self addSubview:_mainButton];
        
    }
    return self;
}



@end
