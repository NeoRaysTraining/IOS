//
//  TableViewCell.h
//  To_Do_List_CoreData
//
//  Created by Mahaboobsab Nadaf on 08/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskName;
@property (weak, nonatomic) IBOutlet UILabel *tasDate;
@property (weak, nonatomic) IBOutlet UIButton *editButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *deleteButtonOutlet;

@end
