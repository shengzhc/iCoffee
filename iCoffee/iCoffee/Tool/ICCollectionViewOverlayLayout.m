//
//  ICCollectionViewLayout.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/1/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCollectionViewOverlayLayout.h"

@interface ICCollectionViewOverlayLayout ()

@property (nonatomic, assign) NSUInteger cellCount;

@end

@implementation ICCollectionViewOverlayLayout

- (void)prepareLayout
{
    [super prepareLayout];
    _cellCount = [self.collectionView numberOfItemsInSection:0];
}


- (CGSize)collectionViewContentSize
{
    return self.collectionView.frame.size;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGSize size = CGSizeMake(150, 150);
    attributes.center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMidY(self.collectionView.bounds));
    attributes.size = size;
    return attributes;
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray new];
    for (NSInteger i = 0; i < _cellCount; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        attribute.transform3D = CATransform3DMakeRotation(M_PI/8.0*i, 0, 0, 1.0);
        attribute.alpha = 0.5;
        if (i == _cellCount - 1)
        {
            attribute.alpha = 1.0;
        }
        [attributes addObject:attribute];
    }
    return attributes;
}


@end
