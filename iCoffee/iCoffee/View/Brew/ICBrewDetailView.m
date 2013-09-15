//
//  ICBrewDetailView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewDetailView.h"

#import "ICBrewEntity.h"

@interface ICBrewDetailView ()

@property (nonatomic, strong) UIImageView *brewImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation ICBrewDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView = [[UIScrollView alloc] init];
        self.contentView.scrollEnabled = YES;
        
        self.brewImageView = [[UIImageView alloc] init];
        self.nameLabel = [UILabel labelWithFrame:CGRectZero
                                            text:@""
                                       alignment:NSTextAlignmentCenter
                                            font:[UIFont icBoldFontWithSize:20]
                                       textColor:[UIColor blackColor]];
        self.detailLabel = [UILabel labelWithFrame:CGRectZero
                                              text:@""
                                         alignment:NSTextAlignmentLeft
                                              font:[UIFont icRegularFontWithSize:14]
                                         textColor:[UIColor blackColor]];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.brewImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.detailLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 32);
    self.brewImageView.frame = [self.brewImageView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 200)
                                                                          offset:CGSizeMake(0, 1)
                                                                         options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    
    [self.nameLabel sizeToFit];
    self.nameLabel.frame = [self.nameLabel alignedRectInSuperviewForSize:self.nameLabel.bounds.size
                                                                  offset:CGSizeMake(15, self.brewImageView.verticalEnding + 10)
                                                                 options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    CGFloat width = self.bounds.size.width - 30;
    CGFloat height = [self.detailLabel labelHeightWithMaxWidth:width];
    
    self.detailLabel.frame = [self.detailLabel alignedRectInSuperviewForSize:CGSizeMake(width, height)
                                                                      offset:CGSizeMake(15, self.nameLabel.verticalEnding + 10)
                                                                     options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];

    self.contentView.contentSize = CGSizeMake(self.bounds.size.width, self.detailLabel.verticalEnding + 20);
}

- (void)setData:(ICBrewEntity *)brewEntity
{
    self.brewImageView.image = [UIImage imageNamed:brewEntity.imageURL];
    self.nameLabel.text = brewEntity.name;
    self.detailLabel.text= brewEntity.description;
}

@end
