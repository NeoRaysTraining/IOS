//
//  ViewController.h
//  TaskOnNSMutableArray
//
//  Created by test on 13/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelFieldOne;
@property (weak, nonatomic) IBOutlet UILabel *labelFieldTwo;

@property (weak, nonatomic) IBOutlet UILabel *labelFieldThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFieldFour;
@property (weak, nonatomic) IBOutlet UITextField *textFieldClick;
//@property(strong, nonatomic)NSMutableString *list;

@property(strong, nonatomic)NSMutableArray *myArray;

- (IBAction)clickHereButton:(id)sender;

@end

