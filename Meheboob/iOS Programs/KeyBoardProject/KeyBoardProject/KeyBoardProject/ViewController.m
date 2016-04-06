//
//  ViewController.m
//  KeyBoardProject
//
//  Created by test on 3/31/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc]
                                 
                                 initWithTarget:self action:@selector(dismissKeyboard)
                                 ];
    [self.view  addGestureRecognizer:tap];
}
-(void)dismissKeyboard{
    [_TextField resignFirstResponder];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)touchButton:(id)sender {
    
    NSLog(@"Inside the touch button");
    //Creating string object by using text typed in text field
    NSString *message = [[NSString alloc]initWithFormat:@"Hello %@",[_TextField text]];
    
    //Assigning the text to the label by using message Object
    [_labelField setText:message];
    
    //Textfield is removed after clicking submit button
    [_TextField resignFirstResponder];
}


@end
