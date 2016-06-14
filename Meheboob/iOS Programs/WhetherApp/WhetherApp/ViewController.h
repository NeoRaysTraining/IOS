//
//  ViewController.h
//  WeatherApp
//
//  Created by Mahaboobsab Nadaf on 04/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "searchController.h"
#import "Reachability.h"

//Creating protocol to receive data back from next Viewcontroller
@protocol ViewBProtocol

- (void)setData:(NSString *)data;
-(void)getCity : (NSMutableArray *)getCity;

@end

@interface ViewController : UIViewController<ViewBProtocol>




@property (weak, nonatomic) IBOutlet UILabel *feelsLike;


@property (weak, nonatomic) IBOutlet UILabel *cloudCover;

@property (weak, nonatomic) IBOutlet UILabel *humiDity;
@property (weak, nonatomic) IBOutlet UILabel *pressure;

@property (weak, nonatomic) IBOutlet UILabel *observationTime;

@property (weak, nonatomic) IBOutlet UILabel *weatherDesc;

- (IBAction)secondButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *changeInObschanceofrain;




@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (strong, nonatomic)NSDictionary *jsonAPI;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property(strong, nonatomic)NSString *urlString;
@property(strong, nonatomic)NSMutableArray *cityDetails;
@property(strong, nonatomic)NSMutableArray *cityTemp;
@property(strong, nonatomic)NSMutableArray *cityTempImage;
@property(strong, nonatomic)NSMutableArray *cityTempDate;

@property(strong, nonatomic)NSArray *dateCuruent;


@property(strong,nonatomic)NSArray *zerothArray;
@property(strong,nonatomic)NSArray *firstArray;
@property(strong,nonatomic)NSArray *secondArray;
@property(strong, nonatomic)NSArray *transferArray;

- (IBAction)thirdButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *zerothButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *firstButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *secondButtonOutlet;
- (IBAction)dateLeft:(id)sender;
- (IBAction)dateRight:(id)sender;

- (IBAction)cityButtonLeft:(id)sender;
- (IBAction)cityButtonright:(id)sender;



@property(strong, nonatomic)NSString *jsonUrlDelhi;
@property(strong, nonatomic)NSDictionary *jsonDelhi;

@property(strong, nonatomic)NSString *sendDelhiJson;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchLocation;
- (IBAction)searchLocation:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *firstDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *thirdDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondDateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewBack;
@property(strong, nonatomic)NSString *imageImage;

@property(strong, nonatomic)NSMutableArray *cityNamesWithoutDuplicates;

@end

