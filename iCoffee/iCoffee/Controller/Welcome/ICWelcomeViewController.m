//
//  ICWelcomeViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICWelcomeViewController.h"
#import "ICCollectionViewCell.h"

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
    self.navigationItem.leftBarButtonItem = nil;
    
    if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)])
    {
        self.banner = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    }
    else
    {
        self.banner = [[ADBannerView alloc] init];
    }
    self.banner.delegate = self;
    [self.view addSubview:self.banner];
    [self layoutBannerView:self.banner];
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
                            @{@"image": @"welcomescroll_1", @"text":@"Yellow Gradient"},
                            @{@"image": @"welcomescroll_2", @"text":@"Purple Gradient"},
                            @{@"image": @"welcomescroll_3", @"text":@"Green Gradient"}
                            ];
    
    self.scrollPageDatasource = [datasource mutableCopy];
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Convenient
///////////////////////////////////////////
///////////////////////////////////////////
- (void)layoutBannerView:(ADBannerView *)banner
{
    CGSize size = banner.bounds.size;
    
    banner.frame = [banner alignedRectInSuperviewForSize:size
                                                      offset:CGSizeMake(0, 32)
                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark ADBannerViewDelegate
///////////////////////////////////////////
///////////////////////////////////////////
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self layoutBannerView:banner];
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"%@, %@", NSStringFromSelector(_cmd), error);
    [self layoutBannerView:banner];
}


- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    return YES;
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
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
