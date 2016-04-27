//
//  ViewController.m
//  TabelViewMultipleScene
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


self.fieldNames=[[NSArray alloc]initWithObjects:@"FirstName",@"LastName",@"PhoneNumber",@"Address", nil];


    self.fieldValues=[[NSMutableArray alloc]init];


self.imageValue=@"ekVillan";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SubmitButton:(id)sender {
    
    

[self.fieldValues insertObject:self.firstName.text atIndex:0];

[self.fieldValues insertObject:self.lastName.text atIndex:1];
[self.fieldValues insertObject:self.phoneNUm.text atIndex:2];
[self.fieldValues insertObject:self.Addiress.text atIndex:3];
    
   
    NSLog(@"Field value %@",self.fieldValues);

    NSLog(@"Field Name %@",self.fieldNames);
[self performSegueWithIdentifier:@
 "next"sender:self];



}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{


    ViewController2ViewController *vc12=[segue destinationViewController];
 
    
    
    [vc12 getImage:self.imageValue];
    
    [vc12 receiveAllDetails:self.fieldNames :self.fieldValues ];
    
}

@end
