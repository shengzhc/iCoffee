//
//  ICMapPlaceEntityMapper.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/22/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICMapPlaceEntity.h"

#define ICMapPlaceEntityIDMapper @"id"
#define ICMapPlaceEntityReferenceMapper @"reference"
#define ICMapPlaceEntityLatMapper @"geometry.location.lat"
#define ICMapPlaceEntityLngMapper @"geometry.location.lng"

@interface ICMapPlaceEntityMapper : NSObject


+ (ICMapPlaceEntity *)map:(NSDictionary *)dictionary error:(NSError *)error;

@end
