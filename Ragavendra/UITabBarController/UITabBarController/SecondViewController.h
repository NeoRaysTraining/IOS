//
//  SecondViewController.h
//  UITabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UILabel *dispalayLabel;
@property NSArray*IPLTeams;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UIButton *clkichereButton;

@end
