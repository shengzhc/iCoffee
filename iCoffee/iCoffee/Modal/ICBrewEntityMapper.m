//
//  ICBrewEntityMapper.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewEntityMapper.h"

@implementation ICBrewEntityMapper

+ (ICBrewEntity *)map:(NSDictionary *)dictionary error:(NSError *)error
{
    ICBrewEntity *brewEntity = [[ICBrewEntity alloc] init];
    [brewEntity setValue:[dictionary valueForKeyPath:ICBrewEntityNameMapper] forKey:ICBrewEntityName];
    [brewEntity setValue:[dictionary valueForKeyPath:ICBrewEntityLogoImageURLMapper] forKey:ICBrewEntityLogoURL];
    [brewEntity setValue:[dictionary valueForKeyPath:ICBrewEntityImageURLMapper] forKey:ICBrewEntityImageURL];
    [brewEntity setValue:[dictionary valueForKeyPath:ICBrewEntityDescriptionMapper] forKey:ICBrewEntityDescription];
    return brewEntity;
}

@end
