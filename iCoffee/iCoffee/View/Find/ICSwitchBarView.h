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
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) UISwitch *switchButton;

- (id)initWithFrame:(CGRect)frame
                key:(NSString *)key
              title:(NSString *)title
              image:(NSString *)imageURL
           delegate:(id)delegate;

@end
