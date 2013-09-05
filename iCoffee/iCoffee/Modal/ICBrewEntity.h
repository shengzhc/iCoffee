//
//  ICBrewEntity.h
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ICBrewEntityName @"name"
#define ICBrewEntityCategory @"category"
#define ICBrewEntityRegion @"region"
#define ICBrewEntityDescription @"description"
#define ICBrewEntityRate @"rate"
#define ICBrewEntityImageURL @"imageURL"
#define ICBrewEntityLogoURL @"logo"

@interface ICBrewEntity : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSNumber *rate;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *logo;

@end
