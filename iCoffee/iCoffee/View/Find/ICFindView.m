//
//  ICFindView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindView.h"

@interface ICFindView ()

@property (nonatomic, strong) GMSMapView *gmsMapView;

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
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:1.285
                                                                longitude:103.848
                                                                     zoom:12];
        self.gmsMapView = [GMSMapView mapWithFrame:CGRectZero
                                            camera:camera];
        self.gmsMapView.settings.compassButton = YES;
        self.gmsMapView.settings.myLocationButton = YES;
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(1.285, 103.848);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        marker.title = @"Hello World";
        marker.map = self.gmsMapView;
        [self addSubview:self.gmsMapView];
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gmsMapView.frame = self.bounds;
}

@end
