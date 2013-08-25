//
//  ICPopButtonViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButtonViewController.h"

@interface ICPopButtonViewController ()

@property BOOL isExpand;

@end

@implementation ICPopButtonViewController

- (id)initWithDelegate:(id)delegate
       widgetCenter:(CGPoint)center
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        self.isExpand = NO;
        self.initialCenter = center;
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.mainButton = [[ICPopButtonItem alloc] initWithDelegate:self
                                                          image:[UIImage imageNamed:@"bg-addbutton.png"]
                                                         center:self.initialCenter];
    self.mainButton.tag = 0;
    self.mainButton.delegate = self;
    [self.view addSubview:self.mainButton];
}


- (ICPopButtonItem *)musicButton
{
    if (!_musicButton)
    {
        _musicButton = [[ICPopButtonItem alloc] initWithDelegate:self
                                                           image:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                          center:self.initialCenter];
        _musicButton.tag = 1;
    }
    
    return _musicButton;
}


- (void)getTouchedAtItem:(NSInteger)tag
{
    if (!self.isExpand && 0 == tag)
    {
        [self.view.superview insertSubview:self.musicButton
                              belowSubview:self.mainButton];
        
        CGPoint point = self.mainButton.center;
        point.y = point.y - 70;
        
        [UIView animateWithDuration:0.5f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseOut
                         animations:^
        {
                self.musicButton.center = point;
        }
                        completion:^(BOOL finished)
        {
                self.isExpand = YES;
        }];
        
    }
    else if(self.isExpand && 0 == tag)
    {
        [UIView animateWithDuration:0.5f
                              delay:0.0f
                            options:UIViewAnimationCurveEaseOut
                         animations:^
        {
            self.musicButton.center = self.mainButton.center;
            self.musicButton.alpha = 0.2;
        }
                         completion:^(BOOL finished)
        {
            [self.musicButton removeFromSuperview];
            self.musicButton.alpha = 1.0;
            self.isExpand = NO;
        }];
    }
    else if(self.isExpand && 1 == tag)
    {
        CGAffineTransform transform = CGAffineTransformScale(self.musicButton.transform, 2, 2);
        
        [UIView animateWithDuration:0.5f
                         animations:^
        {
            self.musicButton.transform = transform;
            self.musicButton.alpha = 0;
        }
                         completion:^(BOOL finished)
        {
            self.musicButton.isLarge = YES;
            self.isExpand = NO;
            [self.musicButton resetItem];
        }];
    }
}

@end
