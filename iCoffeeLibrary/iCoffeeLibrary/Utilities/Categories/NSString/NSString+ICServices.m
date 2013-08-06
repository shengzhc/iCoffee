//
//  NSString+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSString+ICServices.h"
#import "UIScreen+ICServices.h"

@implementation NSString (ICServices)


+ (BOOL)isEmpty:(NSString *)string
{
    return (!string || [string isEqualToString:@""]);
}

- (BOOL)isEqualIgnoringCase:(NSString *)string
{
    return [self caseInsensitiveCompare:string] == NSOrderedSame;
}

+ (NSString *)randomStringWithLength:(NSUInteger)length
{
    NSString *alphaLowerCase = @"abcdefghijklmnopqrstuvwxyz";
    NSString *alphaUpperCase = [alphaLowerCase uppercaseString];
    NSString *numbers = @"0123456789";
    
    NSString *selectedSet = [NSString stringWithFormat:@"%@%@%@", alphaLowerCase, alphaUpperCase, numbers];
    NSString *randomString = @"";
    
    NSRange range = NSMakeRange(0, 1);
    for (int i=0; i<length; i++)
    {
        range.location = arc4random() % [selectedSet length];
        randomString = [randomString stringByAppendingString:[selectedSet substringWithRange:range]];
    }
    
    return randomString;
}

@end
