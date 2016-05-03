//
//  TableViewCell.h
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *ageLbl;
@property (weak, nonatomic) IBOutlet UILabel *DesigLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobileLbl;

@end
