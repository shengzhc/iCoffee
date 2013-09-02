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

@property (nonatomic, weak) id<gestureProtocol> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ICView *scrollViewPadView;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *categoryLabel;
@property (nonatomic, strong) UILabel *regionLabel;
@property (nonatomic, strong) UILabel *description;
@property (nonatomic, strong) UIView *descriptionBackground;
//@property (nonatomic, strong) UILabel *rateLabel;

@property (nonatomic,strong) UIImageView *categoryIcon;
@property (nonatomic,strong) UIImageView *regionIcon;
@property (nonatomic,strong) UIImageView *screenShot;

- (void)resetDescriptionSize;

@end
