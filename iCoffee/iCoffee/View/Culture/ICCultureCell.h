//
//  ICCultureCell.h
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>
#define VERTICALDIFF 10.0f
#define HORIZONALDIFF 30.0f


@interface ICCultureCell : UITableViewCell

@property UIView *cellBackgroundView;
@property UIImageView *flagImageView;
@property UILabel *countryLabel;
@property UIView *cellSelectedBackgroundView;

@end
