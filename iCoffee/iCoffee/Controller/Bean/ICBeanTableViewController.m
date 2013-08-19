//
//  ICBeanViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanTableViewController.h"
#import "ICBeanView.h"

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
        self.beanTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen screenWidth], [UIScreen screenHeigth]-44) style:UITableViewStylePlain];
        self.beanTableView.dataSource = self;
        self.delegate = self;
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = @"Test";
    return cell;
}

@end
