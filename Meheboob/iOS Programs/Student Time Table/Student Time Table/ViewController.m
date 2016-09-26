//
//  ViewController.m
//  Student Time Table
//
//  Created by Mahaboobsab Nadaf on 26/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    for (int i = 0; i<40; i++) {
        NSString *checkSub = [defaults objectForKey:[NSString stringWithFormat:@"%d",i]];
        
        [[self.buttons objectAtIndex:i] setTitle:checkSub forState:UIControlStateNormal];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSLog(@"Button presses is : %ld",(long)sender.tag);
    
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Time Table" message:@"Subject Name" preferredStyle:UIAlertControllerStyleAlert];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"Enter Subject Name";
        
    }];
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField* name = [controller.textFields objectAtIndex:0];
        
        NSLog(@"The Text is : %@",name.text);
        
        [[self.buttons objectAtIndex:sender.tag] setTitle:name.text forState:UIControlStateNormal];
       
        
        // Storing the data
       
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *keyString = [NSString stringWithFormat:@"%ld",(long)sender.tag];
        [defaults setObject:name.text forKey:keyString];
        [defaults synchronize];
        
        NSLog(@"Agree data Data saved");
        
        
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    
    [controller addAction:alertaction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}


@end
