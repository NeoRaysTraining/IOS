//
//  AEPensionCalculator.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 15/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AEPensionCalculator : UIViewController
- (IBAction)homeButton:(id)sender;
- (IBAction)calculateButton:(id)sender;
- (IBAction)payFrequencyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;
@property (weak, nonatomic) IBOutlet UIToolbar *pickerToolBar;
- (IBAction)pickerViewDoneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *calculateButtonOutlet;

@end
