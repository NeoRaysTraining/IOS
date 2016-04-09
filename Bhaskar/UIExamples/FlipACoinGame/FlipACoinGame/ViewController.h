//
//  ViewController.h
//  FlipACoinGame
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIButton *playButton;

- (IBAction)playButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) IBOutlet UIImageView *headOrTailImageView;

@end

