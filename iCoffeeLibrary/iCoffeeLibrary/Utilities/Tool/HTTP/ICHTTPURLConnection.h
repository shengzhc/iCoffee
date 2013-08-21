//
//  ICURLConnection.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICHTTPURLConnectionDelegate.h"
#import "ICMutableURLRequest.h"

@interface ICHTTPURLConnection : NSURLConnection

- (id)initWithRequest:(ICMutableURLRequest *)request
             delegate:(id)delegate;



@end
