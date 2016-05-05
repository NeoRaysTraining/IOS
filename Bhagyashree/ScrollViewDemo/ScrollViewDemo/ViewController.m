//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSString* empid;
@property (nonatomic,strong) NSString* place;
@property (nonatomic,strong) NSString* desig;
@property (nonatomic,strong) NSString* mobile;
@property (nonatomic,strong) NSString* project;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *idField;
@property (weak, nonatomic) IBOutlet UITextField *desigField;
@property (weak, nonatomic) IBOutlet UITextField *placeField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *projectField;


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

- (IBAction)doneButton:(id)sender {
    
    _name=self.nameField.text;
    _empid=self.idField.text;
    _desig=self.desigField.text;
    _place=self.placeField.text;
    _mobile=self.mobileField.text;
    _project=self.placeField.text;
    
    [self performSegueWithIdentifier:@"Segue1" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 recieveData:self.name:self.empid:self.desig:self.place:self.mobile:self.project];
    
}

@end
