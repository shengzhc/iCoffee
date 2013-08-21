//
//  ICURLResponse.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICHTTPURLResponse : NSObject

@property (nonatomic, strong) NSHTTPURLResponse *response;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSMutableArray *errors;

@end
