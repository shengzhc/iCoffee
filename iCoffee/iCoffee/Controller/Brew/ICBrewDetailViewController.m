//
//  ICBrewDetailViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewDetailViewController.h"
#import "ICBrewEntity.h"
#import "ICBrewDetailView.h"

@interface ICBrewDetailViewController ()

@property (nonatomic, strong) ICBrewDetailView *view;
@property (nonatomic, strong) ICBrewEntity *brewEntity;

@end

@implementation ICBrewDetailViewController

- (id)initWithDelegate:(id)delegate
            brewEntity:(ICBrewEntity *)brewEntity
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        self.brewEntity = brewEntity;
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICBrewDetailView class];
}

- (NSString *)leftBarButtonTitle
{
    return @"Brews";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view setData:self.brewEntity];
}

- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:self.brewEntity.name
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
}

@end
