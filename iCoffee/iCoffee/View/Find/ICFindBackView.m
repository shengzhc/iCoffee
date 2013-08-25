//
//  ICFindBackView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindBackView.h"
#import "ICSwitchBarView.h"

@interface ICFindBackView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) NSMutableArray *switchBarArray;

@end

@implementation ICFindBackView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.datasource = [[ICLocalizable jsonArrayWithFileName:@"findback" type:@"json"] mutableCopy];
        
        self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"find_background"]];
        [self addSubview:self.backgroundImageView];
        
        self.switchBarArray = [NSMutableArray new];

        for (NSDictionary *dictionary in self.datasource)
        {
            ICSwitchBarView *barView = [[ICSwitchBarView alloc]initWithFrame:CGRectZero
                                                                         key:[dictionary valueForKeyPath:@"key"]
                                                                       title:[dictionary valueForKeyPath:@"title"]
                                                                       image:[dictionary valueForKeyPath:@"image"]
                                                                    delegate:self];
            
            [barView addCorners];
            [self addSubview:barView];
            [self.switchBarArray addObject:barView];
        }
    }
    
    return self;
}


- (CGSize)switchBarViewSize
{
    return CGSizeMake(240, 40);
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundImageView.frame = [self.backgroundImageView alignedRectInSuperviewForSize:self.bounds.size
                                                                                      offset:CGSizeMake(0, 0)
                                                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsVerticalCenter)];

    
    CGFloat topping = 20;
    
    for (ICSwitchBarView *barView in self.switchBarArray)
    {
        barView.frame = [barView alignedRectInSuperviewForSize:[self switchBarViewSize]
                                                        offset:CGSizeMake(10, topping)
                                                       options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
        topping = barView.verticalEnding + 10;
    }
}


- (NSString *)types
{
    NSMutableString *ret = [[NSMutableString alloc] init];
    
    for (ICSwitchBarView *barView in self.switchBarArray)
    {
        if (![barView.key isEqualToString:@"types"])
        {
            continue;
        }
        
        if (barView.switchButton.on)
        {
            [ret appendString:[NSString stringWithFormat:@"%@|", [barView.titleLabel.text lowercaseString]]];
        }
    }
    if (ret.length > 0)
    {
        return [[ret substringToIndex:ret.length-1] mutableCopy];
    }
    
    return @"";
}


- (NSString *)opennow
{
    for (ICSwitchBarView *barView in self.switchBarArray)
    {
        if (![barView.key isEqualToString:@"opennow"])
        {
            continue;
        }
        
        if (barView.switchButton.on)
        {
            return @"true";
        }
    }
    
    return @"false";
}


- (NSString *)avoid
{
    for (ICSwitchBarView *barView in self.switchBarArray)
    {
        if (![barView.key isEqualToString:@"avoid"])
        {
            continue;
        }
        
        if (!barView.switchButton.on)
        {
            return @"highways";
        }
    }
    
    return @"";
}

@end
