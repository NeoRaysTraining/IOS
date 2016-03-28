//
//  ViewController.m
//  MyFirstApp
//
//  Created by test on 3/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    //Declare and initilize the mutable array
    NSMutableArray *employeeDetails = [NSMutableArray arrayWithObjects:@"Bhagyashree RK", @"NR148",@"Associate Trainee",@"Bengaluru",@"09845678965",@"28brk@gmail.com",nil];
    
    NSLog(@"%@",employeeDetails);
    
    
    //Declaring and initializing the array having keys
    NSArray *details = @[@"Name",@"EmployeeId",@"Designation",@"Place",@"Contact",@"Email"];
    
    /*Declaring and initializing the array having values for employee 1 */
    NSArray *employee1 = @[@"Bhagyashree",@"NR148",@"Associate Trainee",@"Bengaluru",@"09845678965",@"28brk@gmail.com"];
    
    //Declaring and initializing the array having values for employee 2 */
    NSArray *employee2 = @[@"Bhaskar",@"NR151",@"Associate Trainee",@"Bengaluru",@"7236776237",@"bhaskar@gmail.com"];
    
    /*Declaring and initializing the array having values for employee 3 */
    NSArray *employee3 = @[@"Nadaf",@"NR140",@"Associate Trainee",@"Bengaluru",@"7236776876",@"nadaf@gmail.com"];
    
    /*Declaring and initializing the array having values for employee 4 */
    NSArray *employee4 = @[@"Raghu",@"NR149",@"Associate Trainee",@"Bengaluru",@"78726376237",@"raghu@gmail.com"];
    
    /*Declaring and initializing the array having values for employee 5 */
    NSArray *employee5 = @[@"Harish",@"NR150",@"Associate Trainee",@"Bengaluru",@"8763266237",@"harish@gmail.com"];
    /*Declaring a dictionary and initializing it with objects of two arrays*/
    NSDictionary *emp1deatils = [NSDictionary dictionaryWithObjects:employee1 forKeys:details];
    
    NSLog(@"%@",emp1deatils);
    
     NSDictionary *emp2deatils = [NSDictionary dictionaryWithObjects:employee2 forKeys:details];
    
    NSLog(@"%@",emp2deatils);

    NSDictionary *emp3deatils = [NSDictionary dictionaryWithObjects:employee3 forKeys:details];
    
    NSLog(@"%@",emp3deatils);
    
    NSDictionary *emp4deatils = [NSDictionary dictionaryWithObjects:employee4 forKeys:details];
    
    NSLog(@"%@",emp4deatils);
    
    NSDictionary *emp5deatils = [NSDictionary dictionaryWithObjects:employee5 forKeys:details];
    
    NSLog(@"%@",emp5deatils);
    
    //Declare and initialize the array having dictionaries as objects
    NSMutableArray *employee = [[NSMutableArray alloc ]initWithObjects:emp1deatils,emp2deatils,emp3deatils,emp4deatils,emp5deatils,nil];

    NSLog(@"%@",employee);
    
    
    //Declare and Initialize the dictionary with keys and dictionaries as values
    NSDictionary *empDetails = @{@"dict1":emp1deatils,
                                 @"dict2":emp2deatils,
                                 @"dict3":emp3deatils,
                                 @"dict4":emp4deatils,
                                 @"dict5":emp5deatils,};
    
    //Print the dictionary content
    NSLog(@"%@",empDetails);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
