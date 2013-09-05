//
//  ICBrewDetailViewController.h
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"

@class ICBrewEntity;

@interface ICBrewDetailViewController : ICViewController

- (id)initWithDelegate:(id)delegate
            brewEntity:(ICBrewEntity *)brewEntity;

@end
