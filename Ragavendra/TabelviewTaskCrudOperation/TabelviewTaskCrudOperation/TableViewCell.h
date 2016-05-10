//
//  TableViewCell.h
//  TabelviewTaskCrudOperation
//
//  Created by test on 5/10/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *editOutlet;
@property (weak, nonatomic) IBOutlet UIButton *deleteOutlet;
@property (weak, nonatomic) IBOutlet UILabel *taskName;
@property (weak, nonatomic) IBOutlet UILabel *taskDate;

@end
