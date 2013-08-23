//
//  ICMapPlaceEntityMapper.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/22/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMapPlaceEntityMapper.h"
#import <CoreLocation/CoreLocation.h>

@implementation ICMapPlaceEntityMapper

+ (ICMapPlaceEntity *)map:(NSDictionary *)dictionary error:(NSError *)error
{
    ICMapPlaceEntity *placeEntity = [[ICMapPlaceEntity alloc] init];
    
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityIDMapper] forKey:ICMapPlaceEntityID];
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityReferenceMapper] forKey:ICMapPlaceEntityReference];
    placeEntity.coordinate = CLLocationCoordinate2DMake([[dictionary valueForKeyPath:ICMapPlaceEntityLatMapper] floatValue], [[dictionary valueForKeyPath:ICMapPlaceEntityLngMapper] floatValue]);
    
    return placeEntity;
}


@end
