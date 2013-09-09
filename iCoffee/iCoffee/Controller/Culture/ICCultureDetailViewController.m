//
//  ICCultureDetailViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureDetailViewController.h"
#import "ICCultureDetailView.h"

@interface ICCultureDetailViewController ()

@property NSInteger page;
@property (nonatomic, strong) ICCultureEntity *entity;

@end

@implementation ICCultureDetailViewController

- (id)initWithDelegate:(id)delegate
                  page:(NSInteger)page
         cultureEntity:(ICCultureEntity *)entity
    
{
    self = [super initWithDelegate:delegate];
    if(self){
        _page = page;
        _entity = entity;
    }
    return self;
}

- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:self.entity.country
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:15]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
}

- (Class)viewClass
{
    return [ICCultureDetailView class];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    ICCultureDetailView *cultureDetailView = (ICCultureDetailView *)self.view;
    
    cultureDetailView.titleLabel.text = self.entity.country;
    cultureDetailView.contentField.text = self.entity.content;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
