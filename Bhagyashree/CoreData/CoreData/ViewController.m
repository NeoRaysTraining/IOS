//
//  ViewController.m
//  CoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
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
- (IBAction)viewButton:(id)sender {
    
    
}
- (IBAction)saveButton:(id)sender {
    
    NSManagedObjectContext *context=[self getContext];
    
    NSManagedObject *Person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    
    [Person setValue:self.nameField.text forKey:@"name"];
    [Person setValue:[NSNumber numberWithInt:self.ageField.text.intValue] forKey:@"age"];
    [Person setValue:self.genderField.text forKey:@"gender"];
    
    NSError* error=nil;
    if(![context save:&error])
    {
        NSLog(@"Error in saving");
    }
    else{
        NSLog(@"Data Saved");
    }
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *contex = app.managedObjectContext;
    return contex;
    
}

@end
