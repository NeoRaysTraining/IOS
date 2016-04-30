//
//  TableViewCell.h
//  TableViewCellDisplayFoodDetails
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (weak, nonatomic) IBOutlet UIImageView *imgOutlet;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@end
