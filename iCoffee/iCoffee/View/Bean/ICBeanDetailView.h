//
//  ICBeanDetailView.h
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@protocol gestureProtocol <NSObject>

-(void)moveDetailViewWithTranslation:(CGFloat)translationX withGestureState:(BOOL)state;

@end


@interface ICBeanDetailView : ICView<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, weak) id<gestureProtocol> delegate;


@end
