//
//  ViewController2.m
//  SignUpUsingTable
//
//  Created by test on 27/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
    
    NSLog(@"Scene2 values : %@",self.scene2Dictionary);
    
    self.nameLabelVc2.text = [NSString stringWithFormat:@"%@",[self.scene2Dictionary objectForKey:@"Name"] ];
    
    self.ageLabelVc2.text = [NSString stringWithFormat:@"%@",[self.scene2Dictionary objectForKey:@"Age"] ];
    
    self.genderLabelVc2.text = [NSString stringWithFormat:@"%@",[self.scene2Dictionary objectForKey:@"Gender"] ];
    
    self.countryLabelVc2.text = [NSString stringWithFormat:@"%@",[self.scene2Dictionary objectForKey:@"Country"] ];
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



-(void)getDetails:(NSDictionary *)getDetails{
    //self.scene2Dictionary = [[NSDictionary alloc]init];
    

    self.scene2Dictionary = getDetails;

    NSLog(@"Scene2 values from getDetails: %@",self.scene2Dictionary);
}

@end
