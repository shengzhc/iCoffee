//
//  ICConnectionDelegate.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICHTTPURLConnectionDelegate : NSObject < NSURLConnectionDataDelegate , NSURLConnectionDelegate >

@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) id delegate;

- (id)initWithDelegate:(id)delegate;

@end
