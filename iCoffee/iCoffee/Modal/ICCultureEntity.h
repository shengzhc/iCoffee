//
//  ICCultureEntity.h
//  iCoffee
//
//  Created by Fangzhou Lu on 9/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ICCultureEntityCountry @"country"
#define ICCultureEntityImageURL @"imageURL"

@interface ICCultureEntity : NSObject

@property (nonatomic, strong) NSString * country;
@property (nonatomic, strong) NSString * imageURL;


@end
