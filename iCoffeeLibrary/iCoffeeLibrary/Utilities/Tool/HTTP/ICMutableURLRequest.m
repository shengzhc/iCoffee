//
//  ICMutableURLRequest.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMutableURLRequest.h"

@implementation ICMutableURLRequest

+ (id)requestWithURLString:(NSString *)URLString
                HTTPMethod:(NSString *)HTTPMethod
                      body:(NSDictionary *)body
                     token:(NSString *)token
               contentType:(NSString *)contentType
{
    URLString = [self formatURLString:URLString];
    URLString = [self uriString:URLString
                           body:body];
    NSURL *URL = [NSURL URLWithString:URLString];
    
    if (!URL)
    {
        URL = [NSURL URLWithString:
               [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    ICMutableURLRequest *URLRequest = [super requestWithURL:URL];
    
    [URLRequest setHTTPMethod:HTTPMethod];
    [URLRequest setTimeoutInterval:DBL_MAX];
    [URLRequest setValue:token forHTTPHeaderField:@"Authorization"];
    [URLRequest setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [URLRequest setValue:contentType forHTTPHeaderField:@"Content-Type"];
    

    if ([HTTPMethod isEqualToString:@"PUT"] ||
        [HTTPMethod isEqualToString:@"POST"])
    {
        [URLRequest setValue:contentType forHTTPHeaderField:@"Accept"];
    }
    
    return URLRequest;
}


+ (id)requestWithURLString:(NSString *)URLString
                HTTPMethod:(NSString *)HTTPMethod
                      body:(NSDictionary *)body
                     token:(NSString *)token
{
    return [self requestWithURLString:URLString
                           HTTPMethod:HTTPMethod
                                 body:body
                                token:token
                          contentType:@"application/x-www-form-urlencoded"];
}

+ (ICMutableURLRequest *)GETRequestWithURIString:(NSString *)uriString
                                                token:(NSString *)token
{
    return [self requestWithURLString:uriString
                           HTTPMethod:@"GET"
                                 body:nil
                                token:token
                          contentType:@"application/x-www-form-urlencoded"];
}


+ (ICMutableURLRequest *)PUTRequestWithURIString:(NSString *)uriString
                                            body:(NSDictionary *)body
                                           token:(NSString *)token
{
    return [self requestWithURLString:uriString
                           HTTPMethod:@"GET"
                                 body:body
                                token:token
                          contentType:@"application/x-www-form-urlencoded"];
}


+ (ICMutableURLRequest *)POSTRequestWithURIString:(NSString *)uriString
                                             body:(NSDictionary *)body
                                            token:(NSString *)token
{
    return [self requestWithURLString:uriString
                           HTTPMethod:@"GET"
                                 body:body
                                token:token
                          contentType:@"application/x-www-form-urlencoded"];
}


+ (NSString *)formatURLString:(NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@"\n"
                                             withString:@""];
}


+ (NSString *)uriString:(NSString *)uriString
                   body:(NSDictionary *)body
{
    NSMutableString *parameters = [[NSMutableString alloc] initWithString:uriString];
    
    if (!body)
    {
        return parameters;
    }
    
    [parameters appendString:@"?"];
    
    for (id key in body.allKeys)
    {
        [parameters appendString:[NSString stringWithFormat:@"%@=%@&", key, body[key]]];
    }
    
    return [parameters substringToIndex:parameters.length - 1];
}

@end
