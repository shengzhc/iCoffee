//
//  ICHeaderTableViewController.m
//  Umano
//
//  Created by Shengzhe Chen on 8/11/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICHeaderTableViewController.h"

@interface ICHeaderTableViewController ()

@property (nonatomic, strong) NSArray *rows;

@end

@implementation ICHeaderTableViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        [self setupRows];
    }
    
    return self;
}


- (void)setupRows
{
    self.rows = @[
                  @{
                      @"imageName":@"icon-home",
                      @"text":@"Home"
                      },
                  @{
                      @"imageName":@"icon-popular",
                      @"text":@"Popular"
                      },
                  @{
                      @"imageName":@"icon-playlist",
                      @"text":@"Playlist"
                      },
                  @{
                      @"imageName":@"icon-categories",
                      @"text":@"Categories"
                      },
                  @{
                      @"imageName":@"icon-activity",
                      @"text":@"Activity"
                      },
                  @{
                      @"imageName":@"icon-search",
                      @"text":@"Search"
                      },
                  @{
                      @"imageName":@"icon-settings",
                      @"text":@"Settings"
                      }];
}


- (Class)viewClass
{
    return [ICHeaderTableView class];
}


////////////////////////////////////////////////
////////////////////////////////////////////////
#pragma mark UITableViewDataSource
////////////////////////////////////////////////
////////////////////////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rows count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HeaderTableViewCel";
    NSDictionary *data = [self.rows objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont fontWithSize:16];
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor colorWithWhite:.6 alpha:.5];
        cell.selectedBackgroundView = backgroundView;
    
    }
    cell.imageView.image = [UIImage imageNamed:[data objectForKey:@"imageName"]];
    cell.textLabel.text = [data objectForKey:@"text"];
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
