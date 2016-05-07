//
//  ViewController2.m
//  DisplayCountryInfoCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextField *statesField;
@property (weak, nonatomic) IBOutlet UITextField *populationfield;
@property (weak, nonatomic) IBOutlet UITextField *animalField;
@property (weak, nonatomic) IBOutlet UITextField *birdField;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}
- (IBAction)submitButton:(id)sender {
    
    NSManagedObjectContext *context = [self getContext];
    
    NSManagedObject *country = [NSEntityDescription insertNewObjectForEntityForName:@"Country" inManagedObjectContext:context];
    [country setValue:self.countryField.text forKey:@"cname"];
    [country setValue:[NSNumber numberWithInt:self.statesField.text.intValue] forKey:@"states"];
    [country setValue:[NSNumber numberWithInt:self.populationfield.text.intValue] forKey:@"population"];
    [country setValue:self.animalField.text forKey:@"animal"];
    [country setValue:self.birdField.text forKey:@"bird"];
    
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

@end
