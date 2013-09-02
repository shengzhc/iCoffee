//
//  ICWelcomeView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICWelcomeView.h"
#import "ICScrollImageView.h"
#import "ICCollectionViewOverlayLayout.h"
#import "ICCollectionViewCell.h"

@interface ICWelcomeView ()

@property (nonatomic, strong) UIScrollView *scrollBackgroundView;

@end

@implementation ICWelcomeView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.scrollBackgroundView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.scrollBackgroundView.bounces = YES;
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.clipsToBounds = YES;
        self.scrollView.bounces = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.delegate = self;
        
        [self scrollViewLoadContent:self.scrollView];
        [self.scrollBackgroundView addSubview:self.scrollView];
    
        [self scrollToPageIndex:1 animated:NO];
        
        UICollectionViewLayout *collectionViewlayout = [[ICCollectionViewOverlayLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewlayout];
        self.collectionView.dataSource = delegate;
        [self.collectionView registerClass:[ICCollectionViewCell class] forCellWithReuseIdentifier:@"ICCollectionViewCellIdentifier"];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.clipsToBounds = NO;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:delegate
                                                                                               action:@selector(handleTapGesture:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        tapGestureRecognizer.numberOfTouchesRequired = 1;
        [self.collectionView addGestureRecognizer:tapGestureRecognizer];
        [self.scrollBackgroundView addSubview:self.collectionView];
        [self addSubview:self.scrollBackgroundView];        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollBackgroundView.frame = self.bounds;
    
    self.scrollView.frame = [self.scrollView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 200)
                                                                    offset:CGSizeMake(0, 10)
                                                                   options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    
    self.collectionView.frame = [self.collectionView alignedRectInSuperviewForSize:CGSizeMake(250, 250)
                                                                            offset:CGSizeMake(0, self.scrollView.verticalEnding + 5)
                                                                           options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    
    self.scrollBackgroundView.contentSize = CGSizeMake(self.bounds.size.width, self.scrollView.bounds.size.height + self.collectionView.bounds.size.height + 50);
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Configuration
///////////////////////////////////////////
///////////////////////////////////////////
- (CGSize)scrollPageSize
{
    return CGSizeMake(320, 200);
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Convenient
///////////////////////////////////////////
///////////////////////////////////////////
- (void)scrollViewLoadContent:(UIScrollView *)scrollView
{
    NSUInteger count = [self.delegate numberOfSrollPages:scrollView];
    NSUInteger cycleCount = count + 2;
    NSUInteger xOffset = [self scrollPageSize].width;
    for (NSUInteger index = 0; index < cycleCount; index++)
    {
        NSDictionary *data;
        if (index == 0)
        {
            data = [self.delegate scrollPageDictionaryForIndex:count-1];
        }
        else if (index == cycleCount - 1)
        {
            data = [self.delegate scrollPageDictionaryForIndex:0];
        }
        else
        {
            data = [self.delegate scrollPageDictionaryForIndex:index - 1];
        }
        
        ICScrollImageView *page = [[ICScrollImageView alloc] initWithFrame:[self scrollPageFrameForIndex:index]
                                                                  delegate:self.delegate
                                                                 imageName:[data valueForKey:@"image"]
                                                                      text:[data valueForKey:@"text"]];
        [scrollView addSubview:page];
        xOffset += [self scrollPageSize].width;
    }
    
    scrollView.contentSize = CGSizeMake([self scrollPageSize].width * cycleCount, [self scrollPageSize].height);
}


- (CGRect)scrollPageFrameForIndex:(NSUInteger)pageIndex
{
    NSUInteger count = [self.delegate numberOfSrollPages:self.scrollView] + 2;
    if (pageIndex > count)
    {
        return CGRectZero;
    }
    
    return CGRectMake(pageIndex * [self scrollPageSize].width, 0, [self scrollPageSize].width, [self scrollPageSize].height);
}


- (void)scrollToPageIndex:(NSUInteger)pageIndex
                 animated:(BOOL)animated
{
    NSUInteger count = [self.delegate numberOfSrollPages:self.scrollView] + 2;
    
    if (pageIndex >= count)
    {
        return;
    }

    [self.scrollView setContentOffset:CGPointMake([self scrollPageSize].width * pageIndex, 0)
                             animated:animated];
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Touch
///////////////////////////////////////////
///////////////////////////////////////////
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger count = [self.delegate numberOfSrollPages:scrollView];
    
    if (scrollView.contentOffset.x < [self scrollPageSize].width)
    {
        [self scrollToPageIndex:count animated:NO];
    }
    else if (scrollView.contentOffset.x >= [self scrollPageSize].width * (count + 1))
    {
        [self scrollToPageIndex:1 animated:NO];
    }
}


@end
