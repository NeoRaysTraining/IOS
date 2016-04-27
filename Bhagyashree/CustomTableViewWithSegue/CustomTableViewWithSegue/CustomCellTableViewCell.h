//
//  CustomCellTableViewCell.h
//  CustomTableViewWithSegue
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *idLbl;
@property (weak, nonatomic) IBOutlet UILabel *desigLbl;
@property (weak, nonatomic) IBOutlet UILabel *plcLbl;

@end
