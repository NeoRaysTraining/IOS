//
//  CommLetterDetailsVc.h
//  AEExchange
//
//  Created by test on 6/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface CommLetterDetailsVc : ViewController
- (IBAction)setEmpTitle:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setTitle;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIToolbar *pickerToolBar;
@property (weak, nonatomic) IBOutlet UIView *secondView;
- (IBAction)pickerDone:(id)sender;
@property (strong,nonatomic)NSArray* EmployeeTitle;
@end
