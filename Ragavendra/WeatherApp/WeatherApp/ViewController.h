//
//  ViewController.h
//  WeatherApp
//
//  Created by test on 6/7/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic,strong)NSDictionary *jsonData;

@property (weak, nonatomic) IBOutlet UISearchBar *searchbutton;

@property (weak, nonatomic) IBOutlet UILabel *celsiusLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityDisplayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDisplay;
@property (weak, nonatomic) IBOutlet UILabel *tempDisplaylabel;
@property (nonatomic,strong)NSString *urlstring;
@property (weak, nonatomic) IBOutlet UILabel *weatherDiscLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actiityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *DateDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;
@property (nonatomic,strong)NSMutableArray *cityNames;
@end

