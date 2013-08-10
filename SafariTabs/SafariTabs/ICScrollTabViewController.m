//
//  ICTabViewController.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollTabViewController.h"
#import "ICScrollPageViewController.h"

#import "ICScrollTabView.h"
#import "ICScrollPageView.h"

#define PAGE_MAXIMAL 6

@interface ICScrollTabViewController ()

@property (nonatomic, strong) ICScrollTabView *view;
@property (nonatomic, strong) NSMutableDictionary *pageControllers;

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
        self.pageControllers = [NSMutableDictionary new];
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
    self.pageControl.numberOfPages = PAGE_MAXIMAL;
    [self.pageControl addObserver:self
                       forKeyPath:@"currentPage"
                          options:NSKeyValueObservingOptionNew context:nil];
    self.pageControl.currentPage = 0;
    
    [self loadPageController:0];
    [self loadPageController:1];
    
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


- (CGRect)frameOfPageIndex:(NSUInteger)pageIndex
{
    CGSize size = CGSizeMake([self pageSize].width + 2 * [self pagePadding], [self pageSize].height);
    return CGRectMake(pageIndex * size.width + [self pagePadding], 0,
                      [self pageSize].width, [self pageSize].height);
}


- (UIColor *)colorOfPageIndex:(NSUInteger)pageIndex
{
    switch (pageIndex)
    {
        case 0:
            return [UIColor colorWithHex:0x46E074];
            break;
        case 1:
            return [UIColor colorWithHex:0xB9E619];
            break;
        case 2:
            return [UIColor colorWithHex:0xB339A8];
            break;
        case 3:
            return [UIColor colorWithHex:0xE85F4A];
            break;
        case 4:
            return [UIColor colorWithHex:0x9DA9D1];
            break;
        case 5:
            return [UIColor colorWithHex:0xFAEB14];
            break;
        default:
            break;
    }
    
    return [UIColor whiteColor];
}


- (void)loadPageController:(NSUInteger)pageIndex
{
    NSString *key = [NSString stringWithFormat:@"%i", pageIndex];
    
    if (![self.pageControllers objectForKey:key])
    {
        ICScrollPageViewController *scrollPageViewController = [[ICScrollPageViewController alloc]
                                                                initWithDelegate:self];
        [self.pageControllers setObject:scrollPageViewController
                                 forKey:key];
    }
    
    ICScrollPageViewController *scrollPageViewController = (ICScrollPageViewController *)[self.pageControllers objectForKey:key];

    if (!scrollPageViewController)
    {
        return;
    }
    
    if (!scrollPageViewController.view.superview)
    {
        scrollPageViewController.view.frame = [self frameOfPageIndex:pageIndex];
        [scrollPageViewController.view addCornersWithRadius:10];
        scrollPageViewController.view.backgroundColor = [self colorOfPageIndex:pageIndex];
        [self.scrollView addSubview:scrollPageViewController.view];
    }
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
    return CGSizeMake( PAGE_MAXIMAL * ([self pageSize].width + [self pagePadding] * 2),
                      [self pageSize].height);
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
- (ICScrollPageView *)pageAtIndex:(NSUInteger)index
{
    if (index >= PAGE_MAXIMAL)
    {
        return nil;
    }
    
    NSString *key = [NSString stringWithFormat:@"%i", index];
    
    if ([self.pageControllers objectForKey:key])
    {
        return [(ICScrollPageViewController *)[self.pageControllers objectForKey:key] view];
    }
    
    return nil;
}


// Calculate the center point of a page in scroll content view
- (CGPoint)centerPointOfPage:(NSUInteger)pageIndex
{
    return [[self pageAtIndex:pageIndex] center];
}


// Convert a point in scrollview to device coordinate
- (CGPoint)convertPointToDevice:(CGPoint)point
                       fromPageIndex:(NSUInteger)pageIndex
{
    ICScrollPageView *pageView = [self pageAtIndex:pageIndex];
    CGPoint pointInWindow = [pageView.superview convertPoint:point
                                                  toView:nil];
    CGPoint pointInScreen = [pageView.window convertPoint:pointInWindow
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
    CGFloat offset = self.scrollView.contentOffset.x + [self pageSize].width/2.0 + [self pagePadding];
    NSInteger pageIndex = offset / ([self pageSize].width + 2 * [self pagePadding]);
    return pageIndex >=0 ? pageIndex : 0;
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


- (void)adjustAlphaForPageIndex:(NSUInteger)pageIndex
                          alpha:(CGFloat)alpha
{
    ICScrollPageView *pageView = [self pageAtIndex:pageIndex];
    [pageView setAlpha:alpha];
}


- (void)adjustAlphaForPages
{
    NSUInteger pageIndex = self.pageControl.currentPage;
    NSInteger previousPageIndex = pageIndex - 1;
    NSInteger nextPageIndex = pageIndex + 1;
    
    [self adjustAlphaForPageIndex:pageIndex
                            alpha:[self alphaForPageIndex:pageIndex]];
    
    if (previousPageIndex >= 0)
    {
        [self adjustAlphaForPageIndex:previousPageIndex
                                alpha:[self alphaForPageIndex:previousPageIndex]];
    }
    
    if (nextPageIndex < PAGE_MAXIMAL)
    {
        [self adjustAlphaForPageIndex:nextPageIndex
                                alpha:[self alphaForPageIndex:nextPageIndex]];
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
    self.pageControl.currentPage = [self pageIndexOfScrollView];
    [self loadPageController:self.pageControl.currentPage - 1];
    [self loadPageController:self.pageControl.currentPage + 1];
    [self adjustWallViewFrame];
    [self adjustAlphaForPages];
}


@end
