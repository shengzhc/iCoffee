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
    
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityAddressMapper] forKey:ICMapPlaceEntityAddress];
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityIconMapper] forKey:ICMapPlaceEntityIcon];
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityNameMapper] forKey:ICMapPlaceEntityName];
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityRatingMapper] forKey:ICMapPlaceEntityRating];
    [placeEntity setValue:[dictionary valueForKeyPath:ICMapPlaceEntityTypesMapper] forKey:ICMapPlaceEntityTypes];
    
    return placeEntity;
}


@end
