//
//  ICOverlayViewController.m
//  Umano
//
//  Created by Shengzhe Chen on 8/15/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICOverlayViewController.h"

@interface ICOverlayViewController ()

@property (nonatomic, assign) CGPoint touchBeginPoint;
@property (nonatomic, assign) CGPoint touchLastPoint;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@end

@implementation ICOverlayViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self.delegate
                                                    action:@selector(scrollDown)];    
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
}


- (Class)viewClass
{
    return [ICOverlayView class];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    UITouch *touch = [touches anyObject];
    CGPoint pointInOverlayView = [touch locationInView:self.view];
    self.touchBeginPoint = pointInOverlayView;
    self.touchLastPoint = pointInOverlayView;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view removeGestureRecognizer:self.tapGestureRecognizer];
    UITouch *touch = [touches anyObject];
    CGPoint pointInOverlayView = [touch locationInView:self.view];
    CGPoint offset = CGPointMake(pointInOverlayView.x - self.touchLastPoint.x, pointInOverlayView.y - self.touchLastPoint.y);
    self.touchLastPoint = pointInOverlayView;
    [self.delegate overlayView:self.view didChangeOffset:offset];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    UITouch *touch = [touches anyObject];
    CGPoint pointInOverlayView = [touch locationInView:self.view];
    self.touchLastPoint = pointInOverlayView;
    [self.delegate overlayViewDidEndTouch:self.view];
}

@end
