//
//  TableViewCell.h
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *empNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *empDobLbl;
@property (strong, nonatomic) IBOutlet UILabel *empDesignationLbl;
@property (strong, nonatomic) IBOutlet UILabel *empPhoneNoLbl;

@end
