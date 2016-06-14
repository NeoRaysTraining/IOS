//
//  ViewController2.m
//  SendingDataBackUsingNSNotification
//
//  Created by Mahaboobsab Nadaf on 14/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2{

    NSDictionary *tempDictionary;
    NSString *textFieldText;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendButton:(id)sender {
    
    textFieldText = self.myTextField.text;
    
   tempDictionary =  [NSDictionary dictionaryWithObject:textFieldText forKey:@"sendThis"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"name" object:nil userInfo:tempDictionary];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
