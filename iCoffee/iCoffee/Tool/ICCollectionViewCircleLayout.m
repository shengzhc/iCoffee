//
//  ICCollectionViewLayout.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/1/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCollectionViewCircleLayout.h"

@interface ICCollectionViewCircleLayout ()

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSUInteger cellCount;

@end

@implementation ICCollectionViewCircleLayout

- (void)prepareLayout
{
    [super prepareLayout];
    _center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMidY(self.collectionView.bounds));
    _radius = self.collectionView.bounds.size.width / 2.5;
    _cellCount = [self.collectionView numberOfItemsInSection:0];
}


- (CGSize)collectionViewContentSize
{
    return self.collectionView.frame.size;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * indexPath.item * M_PI / _cellCount), self.center.y + self.radius * sinf(2 * indexPath.item * M_PI / _cellCount));
    attributes.size = CGSizeMake(60, 60);
    return attributes;
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray new];
    for (NSInteger i = 0; i < _cellCount; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}


@end
