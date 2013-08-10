//
//  ICTabViewController.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollTabViewController.h"

#import "ICScrollTabView.h"

@interface ICScrollTabViewController ()

@property (nonatomic, strong) ICScrollTabView *view;
@property (nonatomic, strong) NSMutableArray *pages;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *leftWallView;
@property (nonatomic, strong) UIView *rightWallView;
@property (nonatomic, strong) UILabel *headerLabel;

@end

@implementation ICScrollTabViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        [self setupPages];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Controller and View mapping
    self.scrollView = self.view.scrollView;
    self.pageControl = self.view.pageControl;
    self.leftWallView = self.view.leftWallView;
    self.rightWallView = self.view.rightWallView;
    self.headerLabel = self.view.headerLabel;
    
    // Enable the paging of scrollview and disable clipping
    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.contentSize = [self scrollViewContentSize];

    
    // Set up UIPageController
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.pages.count;
    [self.pageControl addObserver:self
                       forKeyPath:@"currentPage"
                          options:NSKeyValueObservingOptionNew context:nil];
    
    for (UIView *page in self.pages)
    {
        [self.scrollView addSubview:page];
    }
    
    self.scrollView.frame = [self.scrollView alignedRectInSuperviewForSize:CGSizeMake([self pageSize].width + [self pagePadding] * 2, [self pageSize].height)
                                                                    offset:CGSizeMake(0, 0)
                                                                   options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsVerticalCenter)];

    self.leftWallView.frame = CGRectMake(0, self.scrollView.frame.origin.y,
                                         [self leftMargin], self.scrollView.frame.size.height);
    self.rightWallView.frame = CGRectMake(0, self.scrollView.frame.origin.y, 0.1,
                                          self.scrollView.frame.size.height);
    
}


- (Class)viewClass
{
    return [ICScrollTabView class];
}


- (void)setupPages
{
    self.pages = [NSMutableArray array];
    CGRect rect = CGRectMake(0, 0, [self pageSize].width, [self pageSize].height);

    // Soft Green
    UIView *v1 = [[UIView alloc] initWithFrame:rect];
    v1.backgroundColor = [UIColor colorWithHex:0x46E074];
    [v1 addCornersWithRadius:10];
    v1.frame = CGRectMake([self pagePadding], 0, rect.size.width, rect.size.height);
    v1.alpha = 1.0;
    
    // Light Green-Yellow
    UIView *v2 = [[UIView alloc] initWithFrame:rect];
    v2.backgroundColor = [UIColor colorWithHex:0xB9E619];
    [v2 addCornersWithRadius:10];
    v2.frame = CGRectMake(v1.horizontalEnding + 2 * [self pagePadding], 0, rect.size.width, rect.size.height);
    v2.alpha = 0.2;
    
    // Mediate Purpple
    UIView *v3 = [[UIView alloc] initWithFrame:rect];
    v3.backgroundColor = [UIColor colorWithHex:0xB339A8];
    [v3 addCornersWithRadius:10];
    v3.frame = CGRectMake(v2.horizontalEnding + 2 * [self pagePadding], 0, rect.size.width, rect.size.height);
    v3.alpha = 0.2;

    // Shadow Blue
    UIView *v4 = [[UIView alloc] initWithFrame:rect];
    v4.backgroundColor = [UIColor colorWithHex:0x9DA9D1];
    [v4 addCornersWithRadius:10];
    v4.frame = CGRectMake(v3.horizontalEnding + 2 * [self pagePadding], 0, rect.size.width, rect.size.height);
    [self.scrollView addSubview:v4];
    v4.alpha = 0.2;

    // Light Red
    UIView *v5 = [[UIView alloc] initWithFrame:rect];
    v5.backgroundColor = [UIColor colorWithHex:0xE85F4A];
    [v5 addCornersWithRadius:10];
    v5.frame = CGRectMake(v4.horizontalEnding + 2 * [self pagePadding], 0, rect.size.width, rect.size.height);
    v5.alpha = 0.2;
   
    // Bright Yellow
    UIView *v6 = [[UIView alloc] initWithFrame:rect];
    v6.backgroundColor = [UIColor colorWithHex:0xFAEB14];
    [v6 addCornersWithRadius:10];
    v6.frame = CGRectMake(v5.horizontalEnding + 2 * [self pagePadding], 0, rect.size.width, rect.size.height);
    v6.alpha = 0.2;
    
    [self.pages addObject:v1];
    [self.pages addObject:v2];
    [self.pages addObject:v3];
    [self.pages addObject:v4];
    [self.pages addObject:v5];
    [self.pages addObject:v6];
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    // Observe the PageControl change and then change the header label
    if (object == self.pageControl &&
        [keyPath isEqualToString:@"currentPage"])
    {
        self.headerLabel.text = [NSString stringWithFormat:@"Page %i", self.pageControl.currentPage+1];
    }
}

// Calculate the scrollview content size
- (CGSize)scrollViewContentSize
{
    NSUInteger pageCount = self.pages.count;
    
    CGSize contentSize = CGSizeZero;
    
    for (NSUInteger i=0; i<pageCount; i++)
    {
        UIView *page = [self pageAtIndex:i];
        contentSize.width += page.frame.size.width;
        contentSize.width += 2 * [self pagePadding];
        contentSize.height = contentSize.height > page.frame.size.height ? contentSize.height : page.frame.size.height;
    }
    
    return contentSize;
}


- (CGFloat)pagePadding
{
    return 15;
}


- (CGFloat)leftMargin
{
    return 45;
}


- (CGFloat)rightMargin
{
    return 45;
}


- (CGSize)pageSize
{
    return CGSizeMake(200, 300);
}

//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark Convenient
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
- (UIView *)pageAtIndex:(NSUInteger)index
{
    if (index >= self.pages.count)
    {
        return nil;
    }
    
    return (UIView *)[self.pages objectAtIndex:index];
}


// Calculate the center point of a page in scroll content view
- (CGPoint)centerPointOfPage:(NSUInteger)pageIndex
{
    UIView *page = [self pageAtIndex:pageIndex];
    return page.center;
}


// Convert a point in scrollview to device coordinate
- (CGPoint)convertPointToDevice:(CGPoint)point
                       fromPageIndex:(NSUInteger)pageIndex
{
    UIView *page = [self pageAtIndex:pageIndex];
    CGPoint pointInWindow = [page.superview convertPoint:point
                                                  toView:nil];
    CGPoint pointInScreen = [page.window convertPoint:pointInWindow
                                             toWindow:nil];
    
    return pointInScreen;
}


- (CGPoint)centerPointOfPageInDevice:(NSUInteger)pageIndex
{
    return [self convertPointToDevice:[self centerPointOfPage:pageIndex]
                        fromPageIndex:pageIndex];
}
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark Adjust
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
- (NSUInteger)pageIndexOfScrollView
{
    CGPoint deviceCenter = CGPointMake([UIScreen screenWidth]/2.0,
                                       [UIScreen screenHeigth]/2.0);
    
    NSUInteger min = INT_MAX;
    NSUInteger result;
    NSUInteger pageIndex;
    NSMutableString *log = [[NSMutableString alloc] init];
    for (pageIndex = 0; pageIndex < self.pages.count; pageIndex++)
    {
        CGPoint pageCenter = [self centerPointOfPageInDevice:pageIndex];
        [log appendString:NSStringFromCGPoint(pageCenter)];
        if (min > abs(pageCenter.x - deviceCenter.x))
        {
            min = abs(pageCenter.x - deviceCenter.x);
            result = pageIndex;
        }
    }
    
    return result;
}


- (CGFloat)alphaForPageIndex:(NSUInteger)pageIndex
{
    static CGFloat minAlpha = 0.2;

    CGPoint deviceCenter = [UIScreen screenCenter];
    CGPoint pointOfPage = [self centerPointOfPageInDevice:pageIndex];
    
    CGFloat distance = fabsf(deviceCenter.x - pointOfPage.x);
    CGFloat span = [self pageSize].width + 2 * [self pagePadding];
    
    if (distance >= span)
    {
        return minAlpha;
    }
    
    return minAlpha + (span - distance) * 0.8 / span;
}


// Adjust the left and right wall view to disable the scrollable area of scrollview
- (void)adjustWallViewFrame
{
    CGPoint contentOffset = self.scrollView.contentOffset;
    CGRect leftRect = self.leftWallView.frame;
    leftRect.size.width = [self leftMargin] - contentOffset.x > 0 ? [self leftMargin] - contentOffset.x : 0.1;
    self.leftWallView.frame = leftRect;
    
    CGRect rightRect = self.rightWallView.frame;
    CGFloat distance = contentOffset.x + [UIScreen screenWidth] + [self rightMargin] - self.scrollView.contentSize.width;
    distance = distance < 0 ? 0.1 : distance;
    rightRect.origin.x = [UIScreen screenWidth] - distance;
    rightRect.size.width = distance;
    
    self.rightWallView.frame = rightRect;
}


- (void)adjustAlphaForPages
{
    for (NSUInteger pageIndex=0; pageIndex<self.pages.count; pageIndex++)
    {
        UIView *page = [self pageAtIndex:pageIndex];
        [page setAlpha:[self alphaForPageIndex:pageIndex]];
    }
}
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark UIScrollViewDelegate
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
// Change the wall frame, alpha of pages, and page control value
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self adjustWallViewFrame];
    [self adjustAlphaForPages];
    self.pageControl.currentPage = [self pageIndexOfScrollView];
}


@end
