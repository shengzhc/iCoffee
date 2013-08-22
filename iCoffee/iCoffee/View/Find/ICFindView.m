//
//  ICFindView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindView.h"

@interface ICFindView ()

@end

@implementation ICFindView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.mapView];
        self.mapView.showsUserLocation = YES;
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.mapView.frame = self.bounds;
}

@end
