//
//  ICMapPlaceEntity.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/22/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#define ICMapPlaceEntityID @"id"
#define ICMapPlaceEntityReference @"reference"
#define ICMapPlaceEntityIcon @"iconURL"
#define ICMapPlaceEntityName @"name"
#define ICMapPlaceEntityRating @"rating"
#define ICMapPlaceEntityTypes @"types"
#define ICMapPlaceEntityAddress @"address"

@interface ICMapPlaceEntity : NSObject < MKAnnotation >

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *reference;
@property (nonatomic, strong) NSString *iconURL;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSArray *types;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
