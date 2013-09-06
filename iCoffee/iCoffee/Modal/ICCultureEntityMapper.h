//
//  ICCultureEntityMapper.h
//  iCoffee
//
//  Created by Fangzhou Lu on 9/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICCultureEntity.h"

#define ICCultureEntityMapperCountry @"country"
#define ICCultureEntityMapperImageURL @"image"
#define ICCultureEntityMapperContent @"content"

@interface ICCultureEntityMapper : NSObject

+ (ICCultureEntity *)map:(NSDictionary *)dictionary error:(NSError *)error;

@end
