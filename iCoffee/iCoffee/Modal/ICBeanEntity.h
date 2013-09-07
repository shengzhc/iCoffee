//
//  ICBeanEntity.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ICBeanEntityName @"name"
#define ICBeanEntityCategory @"category"
#define ICBeanEntityRegion @"region"
#define ICBeanEntityDescription @"description"
#define ICBeanEntityRate @"rate"
#define ICBeanEntityImageURL @"imageURL"
#define ICBeanEntityLogo @"logo"

@interface ICBeanEntity : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSNumber *rate;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *logo;

@end
