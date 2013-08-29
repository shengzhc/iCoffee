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
            beanEntity:(ICBeanEntity *)beanEntity;
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        _beanEntity = beanEntity;
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICBeanDetailView class];
}


- (NSString *)leftBarButtonTitle
{
    return @"Beans";
}


- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:self.beanEntity.name
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
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
        
    beanDetailView.description.text = self.beanEntity.description;
    
    beanDetailView.screenShot.image = self.screenShot;
    [beanDetailView resetDescriptionSize];
}

- (void)moveDetailViewWithTranslation:(CGFloat)translationX
                     withGestureState:(BOOL)state
{
    if (translationX<0)
    {
        return;
    }
    
    ICBeanDetailView *beanDetailView = (ICBeanDetailView *)self.view;
    CGPoint navigationCenter = self.navigationController.navigationBar.center;

    
    CGRect frame = CGRectMake(0, beanDetailView.scrollViewPadView.frame.origin.y, beanDetailView.frame.size.width, beanDetailView.frame.size.height);
    
    if (!state)
    {
        [UIView animateWithDuration:0.0f
                         animations:^
        {
            CGRect stopFrame = CGRectMake(translationX, frame.origin.y, frame.size.height, frame.size.height);
            beanDetailView.scrollViewPadView.frame = stopFrame;
            
            CGPoint stopPoint = CGPointMake(navigationCenter.x+translationX, navigationCenter.y);
            self.navigationController.navigationController.navigationBar.center = stopPoint;
            
        }];
    }
    else
    {
        if (translationX<frame.size.width/6.0)
        {
            [UIView animateWithDuration:0.3f
                             animations:^
            {
                beanDetailView.scrollViewPadView.frame = frame;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3f
                             animations:^
            {
                beanDetailView.scrollViewPadView.frame = CGRectMake(frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
            }
                             completion:^(BOOL finished)
            {
                //[self.view removeFromSuperview];
                [self.navigationController popViewControllerAnimated:NO];
            }];
        }
    }
}
@end
