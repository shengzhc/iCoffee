//
//  ICCellFactory.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICSettingCell.h"
#import "ICBrewCell.h"
#import "ICBeanCell.h"

typedef enum
{
    CellTypeSettingCell,
    CellTypeBrewCell,
    CellTypeBeanCell,
    CellTypeDefault
}CellType;

@interface ICCellFactory : UITableViewCell

+ (UITableViewCell *)cellWithCellType:(CellType)cellType
                         forTableView:(UITableView *)tableView;

@end
