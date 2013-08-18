//
//  ICWelcomeViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICWelcomeViewController.h"

@interface ICWelcomeViewController ()

@property (nonatomic, strong) NSMutableArray *scrollPageDatasource;

@end

@implementation ICWelcomeViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        [self setupScrollPageDataSource];
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICWelcomeView class];
}


- (void)setupScrollPageDataSource
{
    NSArray *datasource = @[
                            @{@"image": @"welcomescroll_1", @"text":@"Yellow Gradient"},
                            @{@"image": @"welcomescroll_2", @"text":@"Purple Gradient"},
                            @{@"image": @"welcomescroll_3", @"text":@"Green Gradient"}
                            ];
    
    self.scrollPageDatasource = [datasource mutableCopy];
}


- (NSUInteger)numberOfSrollPages:(UIScrollView *)scrollView
{
    return [self.scrollPageDatasource count];
}


- (NSDictionary *)scrollPageDictionaryForIndex:(NSUInteger)pageIndex
{
    if (pageIndex > self.scrollPageDatasource.count)
    {
        return nil;
    }
    
    return self.scrollPageDatasource[pageIndex];
}

@end
