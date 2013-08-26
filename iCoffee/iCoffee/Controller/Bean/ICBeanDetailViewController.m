//
//  ICBeanDetailViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailViewController.h"
#import "ICBeanDetailView.h"

@interface ICBeanDetailViewController ()<gestureProtocol>

@end

@implementation ICBeanDetailViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICBeanDetailView class];
}


- (NSString*)headerBarTitle
{
    return @"Bean Detail";
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.beanEntity.imageURL]]];
    
    
    ICBeanDetailView *beanDetailView = (ICBeanDetailView *)self.view;

    beanDetailView.imageView.image = image;
    beanDetailView.nameLabel.text = self.beanEntity.name;
    beanDetailView.categoryLabel.text = self.beanEntity.category;
    beanDetailView.regionLabel.text = self.beanEntity.region;

    NSString *rateString = [[NSString alloc] initWithFormat:@"Rate: %@",self.beanEntity.rate];
    beanDetailView.rateLabel.text = rateString;
    
    beanDetailView.description.text = self.beanEntity.description;
}



- (void)moveDetailViewWithTranslation:(CGFloat)translationX
                     withGestureState:(BOOL)state
{
    if (translationX<0)
    {
        return;
    }
    
    CGRect frame = [self.view superview].frame;
    
    if (!state)
    {
        [UIView animateWithDuration:0.0f
                         animations:^
        {
            CGRect stopFrame = CGRectMake(translationX, frame.origin.y, frame.size.height, frame.size.height);
            self.view.frame = stopFrame;
        }];
    }
    else
    {
        if (translationX<frame.size.width/5.0)
        {
            [UIView animateWithDuration:0.5f
                             animations:^
            {
                self.view.frame = frame;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5f
                             animations:^
            {
                self.view.frame = CGRectMake(frame.size.width, frame.origin.x, frame.size.width, frame.size.height);
            }
                             completion:^(BOOL finished)
            {
                [self.view removeFromSuperview];
            }];
        }
    }
}
@end
