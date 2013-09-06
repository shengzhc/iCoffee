//
//  ICCultureEntityMapper.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureEntityMapper.h"

@implementation ICCultureEntityMapper

+(ICCultureEntity *)map:(NSDictionary *)dictionary error:(NSError *)error
{
    ICCultureEntity *cultureEntity = [[ICCultureEntity alloc] init];
    [cultureEntity setValue:[dictionary valueForKeyPath:ICCultureEntityMapperCountry] forKey:ICCultureEntityCountry];
    [cultureEntity setValue:[dictionary valueForKeyPath:ICCultureEntityMapperImageURL] forKey:ICCultureEntityImageURL];
    [cultureEntity setValue:[dictionary valueForKeyPath:ICCultureEntityMapperContent] forKey:ICCultureEntityContent];
    
    return cultureEntity;
}

@end
