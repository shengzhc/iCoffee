//
//  ICPopButtonItems.h
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ICPopButtonDelegate <NSObject>

- (void)getTouchedAtItem:(NSInteger)tag;

@end

@interface ICPopButtonItem : UIImageView

@property (nonatomic, weak) id < ICPopButtonDelegate > delegate;
@property (nonatomic, assign) BOOL isLarge;

- (id)initWithDelegate:(id < ICPopButtonDelegate >) delegate
                 image:(UIImage *)image
                center:(CGPoint)center;



-(void)resetItem;

@end
