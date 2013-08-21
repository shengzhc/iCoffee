//
//  ICLocalizable.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICLocalizable : NSObject

+ (NSArray *)jsonArrayWithFileName:(NSString *)fileName
                              type:(NSString *)type;

+ (NSDictionary *)jsonObjectWithFileName:(NSString *)fileName
                                    type:(NSString *)type;


+ (NSString *)stringValueInPlist:(NSString *)fileName
                         keyPath:(NSString *)keyPath;

@end
