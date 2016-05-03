//
//  TableViewCell.h
//  MVC_Using_Custom_TableView
//
//  Created by Meheboob Nadaf on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLebel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@end
