//
//  ICWelcomeViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICWelcomeViewController.h"
#import "ICCollectionViewCell.h"
#import "ICPopoverViewController.h"

@interface ICWelcomeViewController ()

@property (nonatomic, strong) NSMutableArray *scrollPageDatasource;
@property (nonatomic, strong) ADBannerView *banner;
@property (nonatomic, strong) UICollectionView *collectionView;

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView = self.view.collectionView;
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItems = nil;
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Configuration
///////////////////////////////////////////
///////////////////////////////////////////
- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero text:@"iCoffee"
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
}


- (void)setupScrollPageDataSource
{
    NSArray *datasource = @[
                            @{@"image": @"bean_pacamara", @"text":@"Pacamara"},
                            @{@"image": @"brew_siphon", @"text":@"Siphon Vacuum Brew"},
                            @{@"image": @"brew_espresso", @"text":@"Espresso Brew"}
                            ];
    
    self.scrollPageDatasource = [datasource mutableCopy];
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark ICScrollViewDatasourceDelegate
///////////////////////////////////////////
///////////////////////////////////////////
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
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark UICollectionViewDataSource
///////////////////////////////////////////
///////////////////////////////////////////
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ICCollectionViewCellIdentifier" forIndexPath:indexPath];
    switch (indexPath.row)
    {
        case 0:
            [(ICCollectionViewCell *)cell setBackgroundImage:[UIImage imageNamed:@"coffee_processing"]];
            break;
        case 1:
            [(ICCollectionViewCell *)cell setBackgroundImage:[UIImage imageNamed:@"coffee_roaster"]];
            break;
        case 2:
            [(ICCollectionViewCell *)cell setBackgroundImage:[UIImage imageNamed:@"coffee_grading"]];
            break;
        case 3:
            [(ICCollectionViewCell *)cell setBackgroundImage:[UIImage imageNamed:@"coffee_decaffeination"]];
            break;
        case 4:
            [(ICCollectionViewCell *)cell setBackgroundImage:[UIImage imageNamed:@"coffee_brew"]];
            break;
        case 5:
            [(ICCollectionViewCell *)cell setBackgroundImage:[UIImage imageNamed:@"coffee_serving"]];
            break;
        default:
            break;
    }
    
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Click
///////////////////////////////////////////
///////////////////////////////////////////
- (void)handleTapGesture:(UITapGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        NSInteger zIndex = -1;
        UIView *frontMostView = nil;
        for (NSUInteger i = 0; i < self.collectionView.visibleCells.count; i++)
        {
            UIView *v = self.collectionView.visibleCells[i];
            NSInteger subviewIndex = [self.collectionView.subviews indexOfObject:v];
            CGPoint pointInView = [gestureRecognizer locationInView:v];
            if (CGRectContainsPoint(v.bounds, pointInView) && zIndex < subviewIndex)
            {
                zIndex = subviewIndex;
                frontMostView = v;
            }
        }
        
        if (!frontMostView)
        {
            return;
        }
        
        for (NSUInteger i = 0; i < self.collectionView.visibleCells.count; i++)
        {
            UIView *v = self.collectionView.visibleCells[i];
            if (v == frontMostView)
            {
                [self.collectionView bringSubviewToFront:v];
                v.alpha = 1.0;
            }
            else
            {
                v.alpha = .5;
            }
        }
    }
}

@end
