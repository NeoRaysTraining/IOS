//
//  TableViewCell.h
//  DisplayCountryInfoCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *statesLbl;
@property (weak, nonatomic) IBOutlet UILabel *populationLbl;
@property (weak, nonatomic) IBOutlet UILabel *animalLbl;
@property (weak, nonatomic) IBOutlet UILabel *birdLbl;

@end
