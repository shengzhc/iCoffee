//
//  ICPopButtonViewController.h
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICPopButtonItem.h"


@interface ICPopButtonViewController : ICViewController < ICPopButtonDelegate >

@property (nonatomic, strong) ICPopButtonItem *mainButton;
@property (nonatomic, strong) ICPopButtonItem *musicButton;

@property (nonatomic, assign) CGPoint initialCenter;

-(id)initWithDelegate:(id)delegate
      widgetCenter:(CGPoint)center;

@end
