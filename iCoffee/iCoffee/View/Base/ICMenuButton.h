//
//  ICMenuButton.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@interface ICMenuButton : ICView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
          imageName:(NSString *)imageName
               text:(NSString *)text;

@end
