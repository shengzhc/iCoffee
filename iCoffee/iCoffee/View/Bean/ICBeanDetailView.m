//
//  ICBeanDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailView.h"

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
        _trueBounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height-64);

        
        self.backgroundColor = [UIColor whiteColor];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _trueBounds.size.width, _trueBounds.size.height)];
        
        [self addSubview:_scrollView];
        
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _trueBounds.size.width, 300)];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.verticalEnding+10, _trueBounds.size.width, 30)];
        _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _nameLabel.numberOfLines = 0;
        
        _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _nameLabel.verticalEnding+10, _trueBounds.size.width, 30)];

        _regionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _categoryLabel.verticalEnding+10, _trueBounds.size.width, 30)];
        _regionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _regionLabel.numberOfLines = 0;

        _rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _regionLabel.verticalEnding+10, _trueBounds.size.width, 30)];

        
        _description = [[UILabel alloc] initWithFrame:CGRectMake(0, _rateLabel.verticalEnding+10, _trueBounds.size.width, 200)];
        _description.lineBreakMode = NSLineBreakByWordWrapping;
        _description.numberOfLines = 0;
        _description.baselineAdjustment = UIBaselineAdjustmentNone;
        _description.textAlignment = NSTextAlignmentJustified;
        _description.backgroundColor = [UIColor redColor];
        
        _scrollView.contentSize = CGSizeMake(_trueBounds.size.width, _description.verticalEnding);
        
        [_scrollView addSubview:_imageView];
        [_scrollView addSubview:_nameLabel];
        [_scrollView addSubview:_categoryLabel];
        [_scrollView addSubview:_regionLabel];
        [_scrollView addSubview:_rateLabel];
        [_scrollView addSubview:_description];
        
        
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
    CGSize size = [self.description.text sizeWithFont:self.description.font constrainedToSize:CGSizeMake(self.trueBounds.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
  
    self.description.frame = CGRectMake(self.description.frame.origin.x, self.description.frame.origin.y, size.width, size.height);
   // [self.description sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.trueBounds.size.width, self.description.verticalEnding);
}

@end
