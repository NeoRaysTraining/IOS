//
//  TabelViewCell.h
//  MVCDemo2
//
//  Created by Raghavendra Dattwad on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *eIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberlabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@property (weak, nonatomic) IBOutlet UIButton *editOutlet;


@property (weak, nonatomic) IBOutlet UIButton *deleteOutlet;


@end
