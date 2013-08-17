//
//  ICScrollImageView.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollPageView.h"

@interface ICScrollImageView : ICScrollPageView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
          imageName:(NSString *)imageName
               text:(NSString *)text;

@end
