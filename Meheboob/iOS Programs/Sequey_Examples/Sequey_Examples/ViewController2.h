//
//  ViewController2.h
//  Sequey_Examples
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController2 : ViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabelDisply;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabelDisplay;

@property(strong,nonatomic)NSString *receiveName;

@property(strong,nonatomic)NSString *receivePass;

-(void)ReceiveNameAndPass : (NSString *)userName : (NSString *) userPassword;

@end
