//
//  ViewController.h
//  AddImageToButtonApp
//
//  Created by test on 3/31/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)plusButton:(id)sender;
- (IBAction)okButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageButton;

@end

