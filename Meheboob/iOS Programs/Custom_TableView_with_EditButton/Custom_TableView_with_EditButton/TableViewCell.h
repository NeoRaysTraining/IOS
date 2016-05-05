//
//  TableViewCell.h
//  Custom_TableView_with_EditButton
//
//  Created by test on 05/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;


@property (weak, nonatomic) IBOutlet UIButton *editButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *deleteButtonOutlet;

@end
