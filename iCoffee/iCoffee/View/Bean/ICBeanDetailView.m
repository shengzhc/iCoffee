//
//  ICBeanDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailView.h"
#import <QuartzCore/QuartzCore.h>

#define PADDING 15
#define ICONSIZE 20
#define TAGTYPE_1 1
#define TAGTYPE_2 2
#define CATEGORYOFFNAME 5



@interface ICBeanDetailView()

@property CGRect trueBounds;

@end


@implementation ICBeanDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        _trueBounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height-76);
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        _scrollViewPadView = [[ICView alloc] initWithFrame:_trueBounds];
        _scrollViewPadView.backgroundColor = [UIColor whiteColor];
        _scrollViewPadView.opaque = YES;
        [self addSubview:_scrollViewPadView];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _trueBounds.size.width, _trueBounds.size.height)];
        
        [_scrollViewPadView addSubview:_scrollView];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _trueBounds.size.width, 200)];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, _imageView.verticalEnding+5, _trueBounds.size.width-PADDING*2, 35)];
        _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _nameLabel.numberOfLines = 0;
        _nameLabel.baselineAdjustment = UIBaselineAdjustmentNone;
        _nameLabel.font = [UIFont fontWithSize:35];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.tag = TAGTYPE_1;
        
        _categoryIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bean_category.png"]];
        _categoryIcon.frame = CGRectMake(PADDING, _nameLabel.verticalEnding+CATEGORYOFFNAME, ICONSIZE, ICONSIZE);
        
        _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(_categoryIcon.horizontalEnding+10, _nameLabel.verticalEnding+CATEGORYOFFNAME, _trueBounds.size.width-PADDING*2-ICONSIZE-10, 20)];
        _categoryLabel.font = [UIFont fontWithSize:15];
        _categoryLabel.backgroundColor = [UIColor clearColor];
        _categoryLabel.textColor = [UIColor blueColor];
        _categoryLabel.tag = TAGTYPE_2;

        _regionIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bean_map.png"]];
        _regionIcon.frame = CGRectMake(PADDING, _categoryLabel.verticalEnding+8, ICONSIZE, ICONSIZE);
        
        _regionLabel = [[UILabel alloc] initWithFrame:CGRectMake(_regionIcon.horizontalEnding+10, _categoryLabel.verticalEnding+8, _trueBounds.size.width-PADDING*2 - ICONSIZE-10, 20)];
        _regionLabel.font = [UIFont fontWithSize:15];
        _regionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _regionLabel.numberOfLines = 0;
        _regionLabel.backgroundColor = [UIColor clearColor];
        _regionLabel.textColor = [UIColor lightGrayColor];
        _regionLabel.tag = TAGTYPE_2;
        
        _description = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, _regionLabel.verticalEnding+40, _trueBounds.size.width-PADDING*2, 200)];
        _description.lineBreakMode = NSLineBreakByWordWrapping;
        _description.numberOfLines = 0;
        _description.baselineAdjustment = UIBaselineAdjustmentNone;
        _description.backgroundColor = [UIColor clearColor];
        _description.tag = TAGTYPE_1;
                
        _scrollView.contentSize = CGSizeMake(_trueBounds.size.width, _description.verticalEnding);
        
        [_scrollView addSubview:_imageView];        
        [_scrollView addSubview:_nameLabel];
        [_scrollView addSubview:_categoryIcon];
        [_scrollView addSubview:_categoryLabel];
        [_scrollView addSubview:_regionIcon];
        [_scrollView addSubview:_regionLabel];
        [_scrollView addSubview:_description];
        
        _screenShot = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
        [self addSubview:_screenShot];
        [self sendSubviewToBack:_screenShot];
        
        UIPanGestureRecognizer *panGesturerRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
        panGesturerRecognizer.delegate = self;
        [self addGestureRecognizer:panGesturerRecognizer];
        
        [self addShadowWithColor:[UIColor blackColor]
                         opacity:0.2
                          radius:0.0f
                          offset:CGSizeMake(-3, 0)];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


-(void)panGestureHandler:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        [self.delegate moveDetailViewWithTranslation:translation.x withGestureState:true];
    }
    else
    {
        [self.delegate moveDetailViewWithTranslation:translation.x withGestureState:false];
    }
}


//Size of label will fit to the text.
- (void)resetDescriptionSize
{
    CGSize size = [self getSizeOfLabel:self.nameLabel];
    self.nameLabel.frame = CGRectMake(PADDING, self.nameLabel.frame.origin.y, size.width, size.height);
    
    self.categoryIcon.frame = CGRectMake(PADDING, self.nameLabel.verticalEnding, ICONSIZE, ICONSIZE);
    
    size = [self getSizeOfLabel:self.categoryLabel];
    self.categoryLabel.frame = CGRectMake(self.categoryLabel.frame.origin.x, self.nameLabel.verticalEnding, size.width, size.height);
    
    self.regionIcon.frame = CGRectMake(PADDING, self.categoryLabel.verticalEnding+8, ICONSIZE, ICONSIZE);
    
    size = [self getSizeOfLabel:self.regionLabel];
    self.regionLabel.frame = CGRectMake(self.regionLabel.frame.origin.x, self.categoryLabel.verticalEnding+8, size.width, size.height);
    
    size = [self getSizeOfLabel:self.description];
    self.description.frame = CGRectMake(PADDING, self.regionLabel.verticalEnding+40, size.width, size.height);
    
    self.scrollView.contentSize = CGSizeMake(self.trueBounds.size.width, self.description.verticalEnding);
}

- (CGSize)getSizeOfLabel:(UILabel *)label
{
    CGFloat width;
    
    if (label.tag==TAGTYPE_1)
    {
        width = self.trueBounds.size.width - PADDING*2;
    }
    else if (label.tag == TAGTYPE_2)
    {
        width = self.trueBounds.size.width - PADDING*2 - ICONSIZE - 10;
    }
    else
    {
        width = self.trueBounds.size.width;
    }
    
    
    CGSize size = [label.text sizeWithFont:label.font
                              constrainedToSize:CGSizeMake(width, MAXFLOAT)
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    return  size;
}

@end
