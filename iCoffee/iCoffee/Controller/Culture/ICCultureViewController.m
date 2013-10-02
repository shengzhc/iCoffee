//
//  ICCultureViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureViewController.h"

#import "ICCultureView.h"
#import "ICCultureCell.h"
#import "ICCultureDetailViewController.h"
#import "ICCultureEntityMapper.h"
#import "ICCulturePageScrollViewController.h"

@interface ICCultureViewController ()

@property NSMutableArray *cultures;

@end

@implementation ICCultureViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        _cultures = [NSMutableArray new];
        NSArray *dataSource = [ICLocalizable jsonArrayWithFileName:@"coffee_culture" type:@"json"];
        
        for (NSDictionary *object in dataSource) {
            [_cultures addObject:[ICCultureEntityMapper map:object error:nil]];
        }
    }
    
    return self;
}

- (Class)viewClass
{
    return [ICCultureView class];
}


- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:@"Culture"
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
}

#pragma tableController
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cultures count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cultureCellIdentifer";
    ICCultureCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[ICCultureCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:cellIdentifier];
    }
        
    ICCultureEntity *cultureEntity = (ICCultureEntity *)[self.cultures objectAtIndex:indexPath.row];
    cell.countryLabel.text = cultureEntity.country;
    cell.flagImageView.image = [UIImage imageNamed:cultureEntity.imageURL];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ICCulturePageScrollViewController *pageScrollViewController = [[ICCulturePageScrollViewController alloc] init];
    pageScrollViewController.cultures = self.cultures;
    pageScrollViewController.pathRow = indexPath.row;
    
    
    [self.navigationController pushViewController:pageScrollViewController animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

@end
