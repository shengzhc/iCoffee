//
//  ICMapPlaceEntity.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/22/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define ICMapPlaceEntityID @"id"
#define ICMapPlaceEntityReference @"reference"

@interface ICMapPlaceEntity : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *reference;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
