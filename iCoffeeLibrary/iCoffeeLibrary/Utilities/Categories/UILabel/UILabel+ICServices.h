//
//  UILabel+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICGeometry.h"

// default alignment LEFT, size 13, color BLACK

@interface UILabel (ICServices)

+ (UILabel *)labelWithText:(NSString *)text;
+ (UILabel *)labelWithTextColor:(UIColor *)color;
+ (UILabel *)labelWithTextColor:(UIColor *)color
                      alignment:(UITextAlignment)alignment;

+ (UILabel *)labelWithText:(NSString *)text
                  font:(UIFont *)font;

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  alignment:(UITextAlignment)alignment;
+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor;
+ (UILabel *)labelWithAlignment:(UITextAlignment)alignment
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor;
+ (UILabel *)labelWithFrame:(CGRect)inputFrame
                       text:(NSString *)text
                  alignment:(UITextAlignment)alignment
                  textColor:(UIColor *)textColor;
+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  alignment:(UITextAlignment)alignment
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor;

- (CGRect)resizeLabelWithMaxWidth:(CGFloat)width;
- (CGRect)resizeLabelWithFixedWith:(CGFloat)width;
- (CGFloat)labelWidthWithMaxWidth:(CGFloat)width;
- (CGFloat)labelHeightWithMaxWidth:(CGFloat)widht;
- (CGSize)labelSizeWithMaxWidth:(CGFloat)width;

@end
