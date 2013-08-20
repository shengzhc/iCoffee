//
//  ICBeanViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanTableViewController.h"
#import "ICBeanView.h"
#import "ICBeanCell.h"

@interface ICBeanTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *beanTableView;

@end

@implementation ICBeanTableViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {        
        
    }
    
    return self;
}

- (Class)viewClass
{
    return [ICBeanView class];
}


- (NSString *)headerBarTitle
{
    return @"Bean";
    
}

-(void)viewDidLoad{
    if(self.beanTableView==nil){
        self.beanTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height - 64) style:UITableViewStylePlain];
        self.beanTableView.dataSource = self;
        self.beanTableView.delegate = self;
        
        [self.view addSubview:self.beanTableView];
    }
}

#pragma tableView Functions
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(ICBeanCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cell";
    ICBeanCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        cell = [[ICBeanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.primaryLabel.text = [[NSString alloc] initWithFormat:@"Cell %d", indexPath.row];
    cell.secondaryLabel.text = @"subtitle";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger number = indexPath.row;
    NSLog(@"%d number in row.",number);
    
    [self.delegate tableSelectedAtRow:number];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

@end
