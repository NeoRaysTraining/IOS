//
//  VerifyDetails.m
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "VerifyDetails.h"

@interface VerifyDetails ()

@end

@implementation VerifyDetails{

  NSMutableString *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.allUsersDataFromTextfields = [[NSMutableArray alloc]init];
    
   // self.forDisplayDetails.text = @"Thes is details";
    
   //Initializing My Array with objects
   // self.myArray = [[NSMutableArray alloc]initWithObjects:@"D1",@"D2",@"D3",@"D4", nil];
    
    //Assignes the valuse for label from array
    //self.forDisplayDetails.text = [self.allUsersDataFromTextfields objectAtIndex:0];
    
    //Defines number of lines for label
   // self.labelFieldOne.numberOfLines = 4;
    
    //Al// locating and Intializing list var
    list = [[NSMutableString alloc] init];
    
    //Gets String object from Array
   
    
    //Assignes the val for label from list object
    
    
    
    self.forDisplayDetails.text = [NSString stringWithFormat:@"%@/n",[self firstScreenDictionary]];
    
   // self.forDisplayDetails.text = [NSString stringWithFormat:@"%@/n",[self secondScreenDictionary]];
    

    
    
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
-(void)allCustomerDictionary:(NSMutableDictionary *)dict1 :(NSMutableDictionary *)dct2

{
    self.firstScreenDictionary = dict1;
    self.secondScreenDictionary = dct2;
    

    NSLog(@"First screen : %@ second screen %@",self.firstScreenDictionary,self.secondScreenDictionary);
    
    self.allUsersDataFromTextfields = [NSMutableArray arrayWithObjects:self.firstScreenDictionary,self.secondScreenDictionary, nil];
    
    NSLog(@"Verify your details: %@",self.allUsersDataFromTextfields);
    
    for (NSString *string in self.firstScreenDictionary) {
        [list appendFormat:@"%@\n", string.mutableCopy];
    }

    NSLog(@"the list is : %@",list);
}

- (IBAction)Submit:(id)sender {
    
    [self performSegueWithIdentifier:@"FinalClass" sender:nil];
}





@end
