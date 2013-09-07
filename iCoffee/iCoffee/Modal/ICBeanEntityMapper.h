//
//  ICBeanEntityMapper.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICBeanEntity.h"

#define ICBeanEntityNameMapper          @"name"
#define ICBeanEntityCategoryMapper      @"category"
#define ICBeanEntityRegionsMapper       @"regions"
#define ICBeanEntityDescriptionMapper   @"desc"
#define ICBeanEntityRateMapper          @"rate"
#define ICBeanEntityImageURLMapper      @"image"
#define ICBeanEntityLogoMapper          @"logo"

@interface ICBeanEntityMapper : NSObject

+ (ICBeanEntity *)map:(NSDictionary *)dictionary error:(NSError *)error;


@end
