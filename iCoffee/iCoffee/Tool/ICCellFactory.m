//
//  ICCellFactory.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCellFactory.h"

@implementation ICCellFactory

+ (UITableViewCell *)cellWithCellType:(CellType)cellType
                         forTableView:(UITableView *)tableView
{
    UITableViewCell *cell = nil;
    
    switch (cellType)
    {
        case CellTypeDefault:
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellTypeDefault"];
            if (!cell)
            {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:@"CellTypeDefault"];
            }
            return cell;
            break;
        default:
            break;
    }
    
    return cell;
}

@end
