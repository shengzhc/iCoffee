//
//  ICBeanCell.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanCell.h"
#import "ICBeanEntity.h"

@interface ICBeanCell ()

@property UILabel *primaryLabel;
@property UILabel *secondaryLabel;
@property UIImageView *primaryImageView;

@end

@implementation ICBeanCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.primaryLabel = [UILabel labelWithFrame:CGRectZero
                                               text:@""
                                          alignment:NSTextAlignmentLeft
                                               font:[UIFont icMediumFontWithSize:16]
                                          textColor:[UIColor blackColor]];
        
        self.secondaryLabel = [UILabel labelWithFrame:CGRectZero
                                                 text:@""
                                            alignment:NSTextAlignmentLeft
                                                 font:[UIFont icLightFontWithSize:13]
                                            textColor:[UIColor blackColor]];

        self.primaryImageView = [[UIImageView alloc] init];
        self.backgroundColor = [UIColor clearColor];
        [self.primaryImageView addCorners];
        
        [self.contentView addSubview:self.primaryLabel];
        [self.contentView addSubview:self.secondaryLabel];
        [self.contentView addSubview:self.primaryImageView];
        
        UIImageView *accessoryImageView = [UIImageView imageViewWithImageNamed:@"button_right"];
        accessoryImageView.bounds = CGRectMake(0, 0, 20, 20);
        self.accessoryType = accessoryImageView;
    }
    return self;
}


- (void)setData:(ICBeanEntity *)beanEntity
{
    self.primaryLabel.text = beanEntity.name;
    self.primaryImageView.image = [UIImage imageNamed:beanEntity.logo];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.primaryImageView.frame = [self.primaryImageView alignedRectInSuperviewForSize:CGSizeMake(60, 60)
                                                                                offset:CGSizeMake(10, 0)
                                                                               options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    [self.primaryLabel sizeToFit];
    self.primaryLabel.frame = [self.primaryLabel alignedRectInSuperviewForSize:self.primaryLabel.bounds.size
                                                                        offset:CGSizeMake(self.primaryImageView.horizontalEnding + 10, 0)
                                                                       options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
}

@end
