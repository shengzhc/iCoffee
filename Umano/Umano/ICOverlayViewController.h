//
//  ICOverlayViewController.h
//  Umano
//
//  Created by Shengzhe Chen on 8/15/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICOverlayView.h"

@protocol ICOverlayViewDelegate <NSObject>

@optional

- (void)overlayView:(ICOverlayView *)overlayView didChangeOffset:(CGPoint)offset;
- (void)overlayViewDidEndTouch:(ICOverlayView *)overlayView;

@end

@interface ICOverlayViewController : ICViewController

@property (nonatomic, strong) ICOverlayView *view;
@property (nonatomic, weak) id < ICOverlayViewDelegate > delegate;

@end
