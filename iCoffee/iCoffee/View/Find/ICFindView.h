//
//  ICFindView.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"
#import "ICFindBackView.h"

#import <MapKit/MapKit.h>

@interface ICFindView : ICView


@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UIView *foreView;
@property (nonatomic, strong) ICFindBackView *backView;

@end
