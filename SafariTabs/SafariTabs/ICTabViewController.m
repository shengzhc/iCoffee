//
//  ICTabViewController.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICTabViewController.h"
#import "ICTabView.h"

@interface ICTabViewController ()

@property (nonatomic, strong) ICTabView *view;
@property (nonatomic, strong) NSMutableArray *pages;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ICTabViewController

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
    self.scrollView = self.view.scrollView;
    self.pageControl = self.view.pageControl;
    self.scrollView.contentSize = [self scrollViewContentSize];
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.pages.count;
    
    for (UIView *page in self.pages)
    {
        [self.scrollView addSubview:page];
    }
    
    self.scrollView.frame = [self.scrollView alignedRectInSuperviewForSize:CGSizeMake(self.view.bounds.size.width - [self leftMargin], 300)
                                                                    offset:CGSizeMake([self leftMargin], 0)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
}


- (Class)viewClass
{
    return [ICTabView class];
}


- (void)setupPages
{
    self.pages = [NSMutableArray array];
    
    CGRect rect = CGRectMake(0, 0, 200, 300);

    // Soft Green
    UIView *v1 = [[UIView alloc] initWithFrame:rect];
    v1.backgroundColor = [UIColor colorWithHex:0x46E074];
    [v1 addCornersWithRadius:10];
    v1.frame = CGRectMake([self pagePadding].width, 0, rect.size.width, rect.size.height);
    
    // Light Green-Yellow
    UIView *v2 = [[UIView alloc] initWithFrame:rect];
    v2.backgroundColor = [UIColor colorWithHex:0xB9E619];
    [v2 addCornersWithRadius:10];
    v2.frame = CGRectMake(v1.horizontalEnding + 2 * [self pagePadding].width, 0, rect.size.width, rect.size.height);
    
    // Mediate Purpple
    UIView *v3 = [[UIView alloc] initWithFrame:rect];
    v3.backgroundColor = [UIColor colorWithHex:0xB339A8];
    [v3 addCornersWithRadius:10];
    v3.frame = CGRectMake(v2.horizontalEnding + 2 * [self pagePadding].width, 0, rect.size.width, rect.size.height);
    
    // Shadow Blue
    UIView *v4 = [[UIView alloc] initWithFrame:rect];
    v4.backgroundColor = [UIColor colorWithHex:0x9DA9D1];
    [v4 addCornersWithRadius:10];
    v4.frame = CGRectMake(v3.horizontalEnding + 2 * [self pagePadding].width, 0, rect.size.width, rect.size.height);
    [self.scrollView addSubview:v4];

    // Light Red
    UIView *v5 = [[UIView alloc] initWithFrame:rect];
    v5.backgroundColor = [UIColor colorWithHex:0xE85F4A];
    [v5 addCornersWithRadius:10];
    v5.frame = CGRectMake(v4.horizontalEnding + 2 * [self pagePadding].width, 0, rect.size.width, rect.size.height);

   
    // Bright Yellow
    UIView *v6 = [[UIView alloc] initWithFrame:rect];
    v6.backgroundColor = [UIColor colorWithHex:0xFAEB14];
    [v6 addCornersWithRadius:10];
    v6.frame = CGRectMake(v5.horizontalEnding + 2 * [self pagePadding].width, 0, rect.size.width, rect.size.height);
    
    [self.pages addObject:v1];
    [self.pages addObject:v2];
    [self.pages addObject:v3];
    [self.pages addObject:v4];
    [self.pages addObject:v5];
    [self.pages addObject:v6];
}


- (CGSize)scrollViewContentSize
{
    NSUInteger pageCount = self.pages.count;
    
    CGSize contentSize = CGSizeZero;
    
    for (NSUInteger i=0; i<pageCount; i++)
    {
        UIView *page = (UIView *)[self.pages objectAtIndex:i];
        
        contentSize.width += page.frame.size.width;
        contentSize.width += 2 * [self pagePadding].width;
        
        contentSize.height = contentSize.height > page.frame.size.height ? contentSize.height : page.frame.size.height;
    }
    
    return contentSize;
}


- (CGSize)pagePadding
{
    return CGSizeMake(15, 300);
}


- (CGFloat)leftMargin
{
    return 60 + 5;
}


- (CGFloat)rightMargin
{
    return 60 + 5;
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


- (CGPoint)centerPointOfPage:(NSUInteger)pageIndex
{
    UIView *page = [self pageAtIndex:pageIndex];
    return page.center;
}


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


- (NSUInteger)pageIndexOfScrollView
{
    CGPoint deviceCenter = CGPointMake([UIApplication sharedApplication].keyWindow.bounds.size.width/2.0,
                                       [UIApplication sharedApplication].keyWindow.bounds.size.height/2.0);
    
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
    
    NSLog(@"%i: %@", result, log);
    return result;
}

- (void)adjustScrollViewFrame
{
    static CGPoint lastContentOffset;
    
    BOOL isLeft = self.scrollView.contentOffset.x - lastContentOffset.x > 0 ? YES : NO;

    CGPoint contentOffset = self.scrollView.contentOffset;
    CGRect rect = self.scrollView.frame;
    
    self.pageControl.currentPage = [self pageIndexOfScrollView];
    
    if (isLeft)
    {
        if (rect.origin.x <= [self leftMargin] &&
            rect.origin.x > 0)
        {
            rect.origin.x = rect.origin.x - contentOffset.x > 0 ? rect.origin.x - contentOffset.x : 0;
            rect.size.width = self.view.bounds.size.width - rect.origin.x;
            self.scrollView.frame = rect;
            contentOffset.x = 0;
            self.scrollView.contentOffset = contentOffset;
        }
        else if (rect.origin.x <= 0  &&
                 (self.scrollView.contentSize.width - contentOffset.x <= self.view.bounds.size.width) &&
                 self.view.bounds.size.width - (self.scrollView.contentSize.width - contentOffset.x) < [self rightMargin])
        {
            rect.origin.x = 0;
            rect.size.width = self.scrollView.contentSize.width - contentOffset.x;
            self.scrollView.frame = rect;
        }
    }
    else
    {
        if (rect.origin.x <= 0 &&
            self.scrollView.contentSize.width - contentOffset.x <= self.view.bounds.size.width &&
            self.view.bounds.size.width - (self.scrollView.contentSize.width - contentOffset.x) < [self rightMargin])
        {
            rect.origin.x = 0;
            rect.size.width = self.scrollView.contentSize.width - contentOffset.x;
            self.scrollView.frame = rect;
        }
        else if (contentOffset.x < 0 &&
                 rect.origin.x < [self leftMargin])
        {
            rect.origin.x = rect.origin.x - contentOffset.x;
            if (rect.origin.x > [self leftMargin] + 5)
            {
                rect.origin.x = [self leftMargin] + 5;
            }
            
            rect.size.width = self.view.bounds.size.width - rect.origin.x;
            self.scrollView.frame = rect;
            contentOffset.x = 0;
            self.scrollView.contentOffset = contentOffset;
        }
    }
    
    lastContentOffset = self.scrollView.contentOffset;
}

//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark UIScrollViewDelegate
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self adjustScrollViewFrame];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}
@end
