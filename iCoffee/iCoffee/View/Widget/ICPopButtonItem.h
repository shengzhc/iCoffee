//
//  ICPopButtonItems.h
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol popButtonDelegate <NSObject>

-(void)getTouchedAtItem:(NSInteger)tag;

@end

@interface ICPopButtonItem : UIImageView

@property (nonatomic,weak) id<popButtonDelegate> delegate;
@property BOOL isLarge;

-(void)resetItem;
- (id)initWithImage:(UIImage *)image withPosition:(CGPoint)center;

@end
