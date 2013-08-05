//
//  ICView.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICView : UIView

@property (nonatomic, weak) id delegate;

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate;


@end
