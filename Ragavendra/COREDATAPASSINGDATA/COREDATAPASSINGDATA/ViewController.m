//
//  ViewController.m
//  COREDATAPASSINGDATA
//
//  Created by test on 5/15/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *ageField;



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

- (IBAction)saveButton:(id)sender {

    NSManagedObjectContext *context=[self getTheContext];
//schema // attribute
    NSManagedObject *per=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];

    [per setValue:self.nameField.text forKey:@"name"];

    NSString*agestr=self.ageField.text;
    [per setValue:[NSNumber numberWithInt:agestr.intValue]forKey:@"age"];

    
        NSError *error=nil;
    if ([ context save:&error]) {
        NSLog(@"save Data");
    }


}



- (IBAction)viewButtton:(id)sender {


    [self performSegueWithIdentifier:@"scene2" sender:self];

}

-(NSManagedObjectContext  *)getTheContext{
    
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context=[app managedObjectContext];
    return  context;
    
}

@end
