//
//  ViewController.h
//  WeatherAppDemo
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"

@interface ViewController : UIViewController 

- (IBAction)searchButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentTemperatureLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentConditionLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableview1;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageDisplay;

@end

