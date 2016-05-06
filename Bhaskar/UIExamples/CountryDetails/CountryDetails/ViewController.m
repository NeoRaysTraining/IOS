//
//  ViewController.m
//  CountryDetails
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *countryNameText;
@property (strong, nonatomic) IBOutlet UITextField *stateNameText;
@property (strong, nonatomic) IBOutlet UITextField *placeNameText;

@property (nonatomic,strong) NSMutableArray *info;
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
- (IBAction)saveAction:(id)sender {
    
//    self.info=[[NSMutableArray alloc]initWithObjects:_countryNameText.text,_stateNameText,_placeNameText, nil];
    NSManagedObjectContext *context=[self getContext];
    NSManagedObject *countryDetails=[NSEntityDescription insertNewObjectForEntityForName:@"Information" inManagedObjectContext:context];
    [countryDetails setValue:_countryNameText.text forKey:@"countryname"];
    [countryDetails setValue:_stateNameText.text forKey:@"statename"];
    [countryDetails setValue:_placeNameText.text forKey:@"placename"];
    NSError *error=nil;
    
    if([context save:&error])
    {
        NSLog(@"data saved");
    }
    else
    {
        NSLog(@"not saved");
    }
    
    
    

}
-(NSManagedObjectContext*)getContext
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
}
@end
