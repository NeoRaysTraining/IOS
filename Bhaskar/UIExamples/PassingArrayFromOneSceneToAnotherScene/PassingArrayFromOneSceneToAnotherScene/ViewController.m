//
//  ViewController.m
//  PassingArrayFromOneSceneToAnotherScene
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "displayPersonDetailsViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *personDetails;

@end

@implementation ViewController

@synthesize  nme,fNme,mNme,addr,dateOfBirth,mobile;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.personDetails=[[NSArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)passingDetailsFromSceneToScene:(id)sender {
    
    
    nme=self.name.text;
    fNme=self.fName.text;
    mNme=self.mName.text;
    addr=self.address.text;
    dateOfBirth=self.dob.text;
    mobile=self.mobileNumber.text;
    
    self.personDetails=[NSArray arrayWithObjects:nme,fNme,mNme,dateOfBirth,addr,mobile, nil];
    
    [self performSegueWithIdentifier:@"displayPersonDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    displayPersonDetailsViewController *vc=[segue destinationViewController];
    [vc receiveDataAsArry:_personDetails];
}
@end

