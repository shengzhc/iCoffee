//
//  ICPopButton.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButton.h"
#define mainButton 0
#define musicButton 1


@implementation ICPopButton

- (id)initWithFrame:(CGRect)frame withIdentifer:(NSInteger)identifer
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"bg-addbutton.png"];
        _imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:_imageView];
        
        
    }
    
    return self;
}



@end
