//
//  ViewController.m
//  CoreDataExample
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

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
- (IBAction)saveButton:(id)sender {
    
    NSManagedObjectContext *context = [self getContext];
    
    NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    [person setValue:self.nameField.text forKey:@"name"];
    [person setValue:[NSNumber numberWithInt:self.ageField.text.intValue] forKey:@"age"];
    [person setValue:self.genderField.text forKey:@"gender"];
    
    NSError *error = nil;
    
    if(![context save:&error])
    {
        NSLog(@"data not saved");
    }
    else
    {
        NSLog(@"data saved");
    }
}


-(NSManagedObjectContext*)getContext
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}

- (IBAction)viewButton:(id)sender {
    
    [self performSegueWithIdentifier:@"Segue" sender:self];
}

@end
