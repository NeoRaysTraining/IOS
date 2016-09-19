//
//  ViewController.h
//  SendingDataBackUsingSegue
//
//  Created by Meheboob Nadaf on 07/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *despalyLabel;
@property(strong, nonatomic)NSString *receivedMessage;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
-(void)getMessage : (NSString *)msg;
@end

