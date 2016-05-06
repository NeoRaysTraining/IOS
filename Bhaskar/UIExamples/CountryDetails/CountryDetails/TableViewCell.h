//
//  TableViewCell.h
//  CountryDetails
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *countryName;
@property (strong, nonatomic) IBOutlet UILabel *stateName;
@property (strong, nonatomic) IBOutlet UILabel *placeName;

@end
