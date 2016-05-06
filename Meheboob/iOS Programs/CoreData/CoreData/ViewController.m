//
//  ViewController.m
//  CoreData
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)saveButton:(id)sender {
    
    NSManagedObjectContext *context = [self getContex];
    
    NSManagedObject *Person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    
    [Person setValue:self.nameField.text forKey:@"name"];
    [Person setValue:self.genderField.text forKey:@"gender"];
    [Person setValue:[NSNumber numberWithInt:self.ageField.text.intValue] forKey:@"age"];
    
    NSError *error = nil;
    
    if (![context save:&error
          ]) {
        NSLog(@"Failed to save data");
    }
    else{
    
        NSLog(@"Saved Data");
    }
    
}

- (IBAction)viewData:(id)sender {
    
    [self performSegueWithIdentifier:@"next" sender:self];
}


-(NSManagedObjectContext *)getContex{

AppDelegate *app = [UIApplication sharedApplication].delegate;

    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}



@end
