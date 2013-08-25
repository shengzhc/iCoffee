//
//  ICPopButtonViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButtonViewController.h"

@interface ICPopButtonViewController ()

@property bool isExpand;

@end

@implementation ICPopButtonViewController

-(id)initWithDelegate:(id)delegate andWidgetCenter:(CGPoint)center
{
    self = [super initWithDelegate:delegate];
    if (self) {
        //Custom
        _isExpand = false;
        _initialCenter = center;
    }
    
    return self;
}

- (void)loadView
{
    UIImage *image = [UIImage imageNamed:@"bg-addbutton.png"];
    self.mainButton = [[ICPopButtonItem alloc] initWithImage:image withPosition:self.initialCenter];
    self.mainButton.tag = 0;
    self.mainButton.delegate = self;
    [self.mainButton sizeToFit];
    
    self.view = self.mainButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma Override getter
-(ICPopButtonItem *)musicButton
{
    if (nil==_musicButton) {
        UIImage *image = [UIImage imageNamed:@"bg-addbutton-highlighted.png"];
        _musicButton = [[ICPopButtonItem alloc] initWithImage:image withPosition:_initialCenter];
        _musicButton.tag = 1;
        _musicButton.delegate = self;
    }
    
    return _musicButton;
}

-(void)getTouchedAtItem:(NSInteger)tag
{
    if (false==self.isExpand&&0==tag) {
        
        [self.view.superview addSubview:self.musicButton];
        [self.view.superview sendSubviewToBack:self.musicButton];
        
        CGPoint point = self.mainButton.center;
        point.y = point.y - 70;
        
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationCurveEaseOut
            animations:^{
                self.musicButton.center = point;
            }completion:^(BOOL finished){
                self.isExpand = true;
            }];
        
    }else if(true == self.isExpand&&0==tag){
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationCurveEaseOut animations:^{
            self.musicButton.center = self.mainButton.center;
        }completion:^(BOOL finished){
            self.isExpand = false;
        }];
    }else if(true == self.isExpand&&1==tag){
        CGAffineTransform transform = CGAffineTransformScale(self.musicButton.transform, 2, 2);
        
        [UIView animateWithDuration:0.5f animations:^{
            self.musicButton.transform = transform;
            self.musicButton.alpha = 0;
        }completion:^(BOOL finished){
            self.musicButton.isLarge = true;
            self.isExpand = false;
            [self.musicButton resetItem];
        }];
    }
}

@end
