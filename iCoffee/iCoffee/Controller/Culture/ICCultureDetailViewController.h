//
//  ICCultureDetailViewController.h
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICCultureEntity.h"

@interface ICCultureDetailViewController : ICViewController

- (id)initWithDelegate:(id)delegate page:(NSInteger)page cultureEntity:(ICCultureEntity *)entity;

@end
