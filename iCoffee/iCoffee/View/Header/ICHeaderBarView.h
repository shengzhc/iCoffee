//
//  ICHeaderBarView.h
//
//  Created by Fangzhou Lu on 8/18/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICView.h"

@interface ICHeaderBarView : ICView

@property (nonatomic, strong) UILabel *titleLabel;

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
          imageName:(NSString *)imageName
               text:(NSString *)text;

- (void)setTitleLabelText:(NSString *)text;

@end
