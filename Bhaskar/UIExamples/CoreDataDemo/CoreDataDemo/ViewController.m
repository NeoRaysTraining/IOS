//
//  ViewController.m
//  CoreDataDemo
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

//@property (nonatomic,strong) NSManagedObjectContext *context;
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

- (IBAction)save:(id)sender {
    
    NSManagedObjectContext *context=[self getContext];
    NSManagedObject *person=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    
    [person setValue:self.name.text forKey:@"name"];
    [person setValue:self.gender.text forKey:@"gender"];
    [person setValue:[NSNumber numberWithInt:self.age.text.intValue] forKey:@"age"];
    NSError *error=nil;
    if ([context save:&error]) {
        NSLog(@"Saved data");
    }
    else
    {
        NSLog(@"save failure");
    }
}

-(NSManagedObjectContext*)getContext
{
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
}
- (IBAction)viewAction:(id)sender {
    
    [self performSegueWithIdentifier:@"view" sender:self];
}
@end


