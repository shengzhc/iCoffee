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
    
    beanDetailView.categoryLabel.text = self.beanEntity.category;//[str stringByAppendingString:self.beanEntity.category];
    
    beanDetailView.regionLabel.text = self.beanEntity.region;//[regionStr stringByAppendingString:self.beanEntity.region];
        
    beanDetailView.description.text = self.beanEntity.description;
    
    [beanDetailView resetDescriptionSize];
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
        if (translationX<frame.size.width/6.0)
        {
            [UIView animateWithDuration:0.3f
                             animations:^
            {
                self.view.frame = frame;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3f
                             animations:^
            {
                self.view.frame = CGRectMake(frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
            }
                             completion:^(BOOL finished)
            {
                [self.view removeFromSuperview];
            }];
        }
    }
}
@end
