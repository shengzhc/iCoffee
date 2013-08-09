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
@property (nonatomic, strong) UIView *leftWallView;
@property (nonatomic, strong) UIView *rightWallView;
@property (nonatomic, strong) UILabel *headerLabel;

@property (nonatomic, assign) CGPoint scrollViewVelocity;
@property (nonatomic, assign) BOOL isPageControlled;

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
    
    self.isPageControlled = NO;
    
    self.scrollView = self.view.scrollView;
    self.pageControl = self.view.pageControl;
    self.leftWallView = self.view.leftWallView;
    self.rightWallView = self.view.rightWallView;
    self.headerLabel = self.view.headerLabel;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.pages.count;
    [self.pageControl addObserver:self
                       forKeyPath:@"currentPage"
                          options:NSKeyValueObservingOptionNew context:nil];
    
    self.headerLabel.text = @"Page 1";

    self.scrollView.contentSize = [self scrollViewContentSize];
    
    for (UIView *page in self.pages)
    {
        [self.scrollView addSubview:page];
    }
    
    self.scrollView.frame = [self.scrollView alignedRectInSuperviewForSize:CGSizeMake(self.view.bounds.size.width, [self pageSize].height)
                                                                    offset:CGSizeMake(0, 0)
                                                                   options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsVerticalCenter)];
    
    self.leftWallView.frame = CGRectMake(0, self.scrollView.frame.origin.y, [self leftMargin], self.scrollView.frame.size.height);
    self.rightWallView.frame = CGRectMake(0, self.scrollView.frame.origin.y, 0.1, self.scrollView.frame.size.height);
    
}


- (Class)viewClass
{
    return [ICTabView class];
}


- (void)setupPages
{
    self.pages = [NSMutableArray array];
    
    CGRect rect = CGRectMake(0, 0, [self pageSize].width, [self pageSize].height);

    // Soft Green
    UIView *v1 = [[UIView alloc] initWithFrame:rect];
    v1.backgroundColor = [UIColor colorWithHex:0x46E074];
    [v1 addCornersWithRadius:10];
    v1.frame = CGRectMake([self pagePadding].width + [self leftMargin], 0, rect.size.width, rect.size.height);
    
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
    
    [self setPageAlpha];
}


- (void)setPageAlpha
{
    for (UIView *page in self.pages)
    {
        page.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    }
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
    
    contentSize.width = contentSize.width + [self leftMargin] + [self rightMargin];
    
    return contentSize;
}


- (CGSize)pagePadding
{
    return CGSizeMake(15, 300);
}


- (CGSize)pageSize
{
    return CGSizeMake(200, 300);
}

- (CGFloat)leftMargin
{
    return 60;
}


- (CGFloat)rightMargin
{
    return 60;
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
    CGFloat span = [self pageSize].width + 2 * [self pagePadding].width;
    if (distance >= span)
    {
        return minAlpha;
    }
    
    return minAlpha + (span - distance) * 0.8 / span;
}


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


- (void)adjustToPageIndex:(NSUInteger)pageIndex
{
    CGPoint point = [self centerPointOfPage:pageIndex];
    point.x -= [UIScreen screenCenter].x;
    point.y = 0;
    [self.scrollView setContentOffset:point animated:YES];
}


- (void)adjustToPageCenter
{
    [self adjustToPageIndex:self.pageControl.currentPage];
}


- (void)adjustAlphaForPages
{
    NSMutableString *log = [[NSMutableString alloc] init];
    for (NSUInteger pageIndex=0; pageIndex<self.pages.count; pageIndex++)
    {
        UIView *page = [self pageAtIndex:pageIndex];
        [page setAlpha:[self alphaForPageIndex:pageIndex]];
        [log appendString:[NSString stringWithFormat:@"%f, ", page.alpha]];
    }
//    NSLog(@"%@", log);
}
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark UIScrollViewDelegate
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self adjustWallViewFrame];
    
    if (!self.isPageControlled)
    {
        self.pageControl.currentPage = [self pageIndexOfScrollView];
    }
    
    [self adjustAlphaForPages];
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (fabs(velocity.x) <= 0.0001)
    {
        [self adjustToPageCenter];
        return;
    }
    
    self.scrollViewVelocity = velocity;
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    CGFloat decelerationRate = scrollView.decelerationRate;
    CGFloat time = fabsf(self.scrollViewVelocity.x / decelerationRate);
    int64_t delayInSeconds = time * 0.95;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
    {
       [self adjustToPageCenter]; 
    });
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.isPageControlled = NO;
}

//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark UIPageControlDelegate
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
- (void)pageControlValueChanged:(id)sender
{
    self.isPageControlled = YES;
    [self adjustToPageIndex:self.pageControl.currentPage];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.pageControl &&
        [keyPath isEqualToString:@"currentPage"])
    {
        self.headerLabel.text = [NSString stringWithFormat:@"Page %i", self.pageControl.currentPage+1];
    }
}

@end
