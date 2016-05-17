//
//  ViewController.m
//  CoreDatapassingDatatbyusingAlertcontrlerr
//
//  Created by test on 5/16/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)AddButton:(id)sender {
  
    
    UIAlertController *controller=
    [UIAlertController alertControllerWithTitle:@"Add  Details " message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Name";
        
    }];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter age";
    }];

    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    UITextField *pname=[controller.textFields objectAtIndex:0];
    UITextField *page=[controller.textFields objectAtIndex:1];
    
    
    
    
    
    
}

-(NSManagedObjectContext *)getTheContext{
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
NSManagedObjectContext *context=[app managedObjectContext];

    return context;
}

@end
