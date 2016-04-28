//
//  TableViewCell.h
//  DisplayingDetailsByClickingOnCell
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *foodName;
@property (strong, nonatomic) IBOutlet UIImageView *foodImage;

@end
