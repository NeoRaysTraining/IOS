//
//  ViewController.m
//  SeguesDemo
//
//  Created by test on 4/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()
@property(strong, nonatomic) NSString *name;
@property (strong, nonatomic)NSString *pwd;
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



- (IBAction)pressData:(id)sender
{
self.name=self.textFireldName.text;
self.pwd=self.textFieldPassWord.text;
   
[self performSegueWithIdentifier:@"Scene2" sender:self];


}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

ViewController2 *destination=[segue destinationViewController];
    [destination receiveNameandPassWord:self.name:self.pwd];

   // NSLog(@"Name : and PassWord :%@",destination);
    
    
}



@end
