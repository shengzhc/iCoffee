//
//  ICPageScrollViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/8/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCulturePageScrollViewController.h"
#import "ICCulturePageScrollView.h"
#import "ICCultureDetailViewController.h"
#import "ICCultureEntity.h"

@interface ICCulturePageScrollViewController ()

@property (nonatomic, strong)NSMutableArray *controllerArray;
@property (nonatomic, strong)ICCulturePageScrollView *pageScrollView;

@end

@implementation ICCulturePageScrollViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    if(self){
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSInteger numberOfViews = [self.cultures count];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (int i=0; i<numberOfViews; i++) {
        [controllers addObject:[NSNull null]];
    }
    
    self.controllerArray = controllers;

    self.pageScrollView = (ICCulturePageScrollView *)self.view;
    self.pageScrollView.scrollView.delegate = self;
    self.pageScrollView.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.pageScrollView.frame)*numberOfViews, CGRectGetHeight(self.pageScrollView.frame));

    NSInteger initPage = self.pathRow;
    
    if(initPage != 0) {
        [self loadScrollViewWithPage:initPage - 1];
    }
    [self loadScrollViewWithPage:initPage];
    if(initPage != self.cultures.count - 1){
        [self loadScrollViewWithPage:initPage + 1];
    }
    
    self.pageScrollView.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.pageScrollView.frame)*initPage,0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:self.entity.country
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:15]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
}

- (Class)viewClass
{
    return [ICCulturePageScrollView class];
}

- (void)loadScrollViewWithPage:(NSInteger)pageNumber
{
    if(pageNumber >= self.cultures.count){
        return;
    }
    
    ICCultureDetailViewController *detailViewController = (ICCultureDetailViewController *)[self.controllerArray objectAtIndex:pageNumber];
    if ((NSNull *)detailViewController == [NSNull null]) {
        ICCultureEntity *entity = [self.cultures objectAtIndex:pageNumber];
        
        detailViewController = [[ICCultureDetailViewController alloc] initWithDelegate:self page:pageNumber cultureEntity:entity];
        [self.controllerArray replaceObjectAtIndex:pageNumber withObject:detailViewController];
    }
    
    if (detailViewController.view.superview == nil) {
        CGRect frame = self.view.frame;
        frame.origin.x = CGRectGetWidth(frame) * pageNumber;
        frame.origin.y = 0;
        detailViewController.view.frame = frame;
        
        [self addChildViewController:detailViewController];
        [self.pageScrollView.scrollView addSubview:detailViewController.view];
        [detailViewController didMoveToParentViewController:self];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(scrollView.frame);
    NSUInteger page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1;
    
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}

@end
