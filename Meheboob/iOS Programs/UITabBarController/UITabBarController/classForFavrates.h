//
//  classForFavrates.h
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface classForFavrates : ViewController<UIPickerViewDataSource,UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textFieldOfFararate;

@property (strong, nonatomic) IBOutlet UIView *pickerViewOfFav;

@property (weak, nonatomic) IBOutlet UILabel *labelForFav;


@property(strong,nonatomic)NSMutableArray *myTeam;

- (IBAction)favButton:(id)sender;

@end
