//
//  ViewController.m
//  PersonDetails
//
//  Created by test on 5/6/16.
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
-(NSManagedObjectContext *)getcontext{
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context=[app  managedObjectContext];
    
    
    return context;
}
- (IBAction)save:(id)sender {

NSManagedObjectContext*context=[self getcontext];
    
NSManagedObject*person=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];

[person setValue:self.nameTextField.text forKey:@"name"];
[person setValue:self.placeTextField.text forKey:@"place"];
    
    NSLog(@"Name Field %@",self.nameTextField.text);
    NSLog(@"Place field %@",self.placeTextField.text);
NSError *error=nil;

if(![context save:&error]){
    
NSLog(@"Failed data");
        
}
else{
    
NSLog(@"save Data");
    }
}
@end
