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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName
                                                         ofType:type];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    
    return jsonArray;
}


+ (NSDictionary *)jsonObjectWithFileName:(NSString *)fileName
                                    type:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName
                                                         ofType:type];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
    
    return jsonObject;
}


+ (NSString *)stringValueInPlist:(NSString *)fileName keyPath:(NSString *)keyPath
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return [dict valueForKeyPath:keyPath];
}

@end

