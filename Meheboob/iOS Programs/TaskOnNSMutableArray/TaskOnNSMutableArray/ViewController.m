//
//  ViewController.m
//  TaskOnNSMutableArray
//
//  Created by test on 13/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    //Defining Variables
    
    NSString *valueFromTextField;
    int buttonCount;
    NSMutableString *list;
    
 
}
@synthesize myArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Initializing My Array with objects
    self.myArray = [[NSMutableArray alloc]initWithObjects:@"D1",@"D2",@"D3",@"D4", nil];
    
    //Assignes the valuse for label from array
    self.labelFieldOne.text = [myArray objectAtIndex:0];
    
    //Defines number of lines for label
    self.labelFieldOne.numberOfLines = 4;
    
    //Allocating and Intializing list var
    list = [[NSMutableString alloc] init];
  
    //Gets String object from Array
    for (NSString *string in myArray) {
        [list appendFormat:@"%@\n", string.mutableCopy];
    }
    
    //Assignes the val for label from list object
    self.labelFieldOne.text = list;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickHereButton:(id)sender {
    
    NSLog(@"Count button %i",buttonCount);
   
    //Assignes the value from text field to var valueFromTextField
    
    valueFromTextField = self.textFieldClick.text;
    
    
    //Incements the value of buttonCount for every lick
    buttonCount++;
    
    //Taking value from textfield and assigning it to var valueFromTextField
    
    NSLog(@"Text Field value : %@",valueFromTextField);
    
    
    if(buttonCount == 1){
        
        
        NSLog(@"inside if 1 ");
        
  
     //Replaces the object of myArray by new object from valueFromTextField
       [myArray replaceObjectAtIndex:0 withObject:valueFromTextField];
        NSLog(@"Array values : %@",myArray);
      
       
      //Calls interateArray method
        [self interateArray : myArray];
        
    }
    
    else if(buttonCount == 2){
        
          NSLog(@"inside if 2 ");
        
        //Replaces the object of myArray by new object from valueFromTextField
        
          [myArray replaceObjectAtIndex:1 withObject:valueFromTextField];
        
         //Calls interateArray method
         [self interateArray : myArray];
        
        
    }
  else  if(buttonCount == 3){
      
      
      NSLog(@"inside if 3 ");
      
      //Replaces the object of myArray by new object from valueFromTextField
      
         [myArray replaceObjectAtIndex:2 withObject:valueFromTextField];
     
       //Calls interateArray method
      [self interateArray : myArray];
      
    }
    
    else if(buttonCount == 4){
       NSLog(@"inside if 4 ");
        
        //Replaces the object of myArray by new object from valueFromTextField
        
           [myArray replaceObjectAtIndex:3 withObject:valueFromTextField];
        
        
        //Calls interateArray method
         [self interateArray : myArray];
    }
    else{
    
         //Calls interateArray method
        
         [self interateArray : myArray];
    }
    

}

-(void)interateArray : (NSArray *)NSArrayMy{
    
  list = [[NSMutableString alloc] init];
    
    
    NSLog(@"Inside iterateArray Method : %@",NSArrayMy);
    for (NSString *string in NSArrayMy) {
        [list appendFormat:@"%@\n", string.mutableCopy];
    }
    self.labelFieldOne.text = list;

}


@end
