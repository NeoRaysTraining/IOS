//
//  TableViewCell.h
//  WeatherAppDemo
//
//  Created by test on 6/8/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *temperatureLabel;

@property (weak, nonatomic) IBOutlet UILabel *datesLabel;
@property (weak, nonatomic) IBOutlet UILabel *MaxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperature;

@end
