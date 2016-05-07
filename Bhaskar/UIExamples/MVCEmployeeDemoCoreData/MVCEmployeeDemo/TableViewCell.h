//
//  TableViewCell.h
//  MVCEmployeeDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *EmpNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *empDesignationLbl;
@property (strong, nonatomic) IBOutlet UIButton *editBtnOutlet;
@property (strong, nonatomic) IBOutlet UIButton *deleteBtnOutlet;
@end
