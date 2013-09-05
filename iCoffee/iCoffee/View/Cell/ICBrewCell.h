//
//  ICBrewCell.h
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICBrewEntity;

@interface ICBrewCell : UITableViewCell

- (void)setData:(ICBrewEntity *)brewEntity;

@end
