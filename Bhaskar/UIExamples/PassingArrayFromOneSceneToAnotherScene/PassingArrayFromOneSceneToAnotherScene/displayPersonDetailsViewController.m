//
//  displayPersonDetailsViewController.m
//  PassingArrayFromOneSceneToAnotherScene
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "displayPersonDetailsViewController.h"
#import "AppDelegate.h"

@interface displayPersonDetailsViewController ()
@property(retain,nonatomic) IBOutletCollection(UILabel) NSArray* arrayOfLabels;
@property (strong, nonatomic) IBOutlet UILabel *displayFromModalSegueLabe;

@
property (nonatomic,strong) NSArray *receivedArray;

@property (assign,nonatomic) int i;

@end

@implementation displayPersonDetailsViewController



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@",self.receivedArray);
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    NSString *str=[app getValueInt];
    NSLog(@"%@",str);
    
    self.displayFromModalSegueLabe.text=str;
    
}
-(void)receiveDataAsArry:(NSArray *)personDetails
{
    self.receivedArray=personDetails;
}
- (IBAction)done:(id)sender {
    
    [self performSegueWithIdentifier:@"modalSegue" sender:self];
}

@end
