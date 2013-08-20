//
//  ICLocalizable.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICLocalizable.h"

@implementation ICLocalizable

+ (NSArray *)jsonArrayWithFileName:(NSString *)fileName
                              type:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:filePath]];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    
    return jsonArray;
}


+ (NSDictionary *)jsonObjectWithFileName:(NSString *)fileName
                                    type:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:filePath]];
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    return jsonObject;
}

@end

