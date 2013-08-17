//
//  ICScrollViewDatasource.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ICScrollPageView;

@protocol ICScrollViewDatasource <NSObject>

- (NSUInteger)numberOfSrollPages:(UIScrollView *)scrollView;
- (NSDictionary *)scrollPageDictionaryForIndex:(NSUInteger)pageIndex;

@end
