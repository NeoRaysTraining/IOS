//
//  ViewController.m
//  CoreDatapassingValueToTabelView
//
//  Created by test on 5/6/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "TabelViewContrloller.h"
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

-(NSManagedObjectContext *)getContext{

AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context=[app managedObjectContext];
    
    
    return  context;
}


- (IBAction)submitButton:(id)sender {
    NSManagedObjectContext *context=[self getContext];

    NSManagedObject*person=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];

    
    [person setValue:self.nameTextFiled.text forKey:@"name"];
    [person setValue:self.designnation.text forKey:@"designation"];
    [person setValue:self.countryTextField.text forKey:@"country"];

    NSLog(@"Name %@",self.nameTextFiled.text);
    NSLog(@"designation %@",self.designnation.text);
      NSLog(@"country %@",self.countryTextField.text);
    NSError *error=nil;
    if([context save:&error]){
        
        NSLog(@"Save data");
        
    }

       

}



@end
