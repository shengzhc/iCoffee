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
#define ICCultureEntityContent @"content"

@interface ICCultureEntity : NSObject

@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *content;


@end
