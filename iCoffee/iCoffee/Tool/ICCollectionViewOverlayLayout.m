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
@property (nonatomic, strong) NSMutableArray *attributesArray;
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
    CGSize size = CGSizeMake(80, 80);
    attributes.center = CGPointMake(50 + (indexPath.row * self.collectionView.bounds.size.width / (_cellCount + 1)), CGRectGetMidY(self.collectionView.bounds) - 50);
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
        float factor = rand()%10/10.0;
        attribute.transform3D = CATransform3DMakeRotation(M_PI*factor, 0, 0, 1.0);
        attribute.alpha = 0.5;
        if (i == 0)
        {
            attribute.alpha = 1.0;
        }
        [attributes addObject:attribute];
    }
    return attributes;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}



@end
