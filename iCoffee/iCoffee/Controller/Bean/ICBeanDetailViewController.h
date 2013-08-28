//
//  ICBeanDetailViewController.h
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICBeanEntity.h"

@interface ICBeanDetailViewController : ICViewController

- (id)initWithDelegate:(id)delegate beanEntity:(ICBeanEntity *)beanEntity;


@property (nonatomic, strong) ICBeanEntity *beanEntity;

@end
