//
//  ICBeanEntityMapper.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanEntityMapper.h"

@implementation ICBeanEntityMapper

+ (ICBeanEntity *)map:(NSDictionary *)dictionary error:(NSError *)error
{
    ICBeanEntity *beanEntity = [[ICBeanEntity alloc] init];
    
    [beanEntity setValue:[dictionary valueForKeyPath:ICBeanEntityNameMapper] forKey:ICBeanEntityName];
    [beanEntity setValue:[dictionary valueForKeyPath:ICBeanEntityCategoryMapper] forKey:ICBeanEntityCategory];
    [beanEntity setValue:[dictionary valueForKeyPath:ICBeanEntityRegionsMapper] forKey:ICBeanEntityRegion];
    [beanEntity setValue:[dictionary valueForKeyPath:ICBeanEntityDescriptionMapper] forKey:ICBeanEntityDescription];
    [beanEntity setValue:[dictionary valueForKeyPath:ICBeanEntityRateMapper] forKey:ICBeanEntityRate];
    [beanEntity setValue:[dictionary valueForKeyPath:ICBeanEntityImageURLMapper] forKey:ICBeanEntityImageURL];
    
    return beanEntity;
}


@end
