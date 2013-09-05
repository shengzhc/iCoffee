//
//  ICBrewEntityMapper.h
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICBrewEntity.h"

#define ICBrewEntityNameMapper          @"name"
#define ICBrewEntityCategoryMapper      @"category"
#define ICBrewEntityRegionsMapper       @"regions"
#define ICBrewEntityDescriptionMapper   @"desc"
#define ICBrewEntityRateMapper          @"rate"
#define ICBrewEntityImageURLMapper      @"image"
#define ICBrewEntityLogoImageURLMapper  @"logo"

@interface ICBrewEntityMapper : NSObject

+ (ICBrewEntity *)map:(NSDictionary *)dictionary error:(NSError *)error;

@end
