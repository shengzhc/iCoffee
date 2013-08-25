//
//  ICSwitchBarView.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@interface ICSwitchBarView : ICView

@property (nonatomic, strong) UILabel *titleLabel;


- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
           delegate:(id)delegate;
@end
