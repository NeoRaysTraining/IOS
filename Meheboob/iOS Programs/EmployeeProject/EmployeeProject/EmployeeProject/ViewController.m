//
//  ViewController.m
//  EmployeeProject
//
//  Created by test on 3/28/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    //Declares interface for empoloyeeFields
    NSMutableArray *employeeFields;
    
    //Declares interface for employee Objects
    NSArray *employeeObject1;
    NSArray *employeeObject2;
    NSArray *employeeObject3;
    NSArray *employeeObject4;
    NSArray *employeeObject5;
    
    //Declares interface for Keeping all employee objects in single Array
    NSMutableArray *allEmployeeObjects;
    
    ////Declares interface for Key Value pairs
    NSMutableDictionary *emp1Details;
    NSMutableDictionary *emp2Details;
    NSMutableDictionary *emp3Details;
    NSMutableDictionary *emp4Details;
     NSMutableDictionary *emp5Details;
    
    //Declares interface for all Dictionary objects in Dictionary
    NSMutableDictionary *allDictionaryObjectsInDictionary;
    
    //Declares interface for all Dictionary objects in Array
    NSMutableArray *allEmployeeObjectInArray;
    
    NSString *placeOfEmployee;
    
    
    
    
}
@end

@implementation ViewController
@synthesize EmployeeIDLabel, FirstNameLabel,LastNameLabel,DesignitationLabel,DOBLabel,MobileNoLabel,AdressLabel;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Creates an array object of employee fields
    employeeFields = [[NSMutableArray alloc]initWithObjects:@"Employee ID",@"First Name",@"Last Name",@"Designitation",@"DOB",@"Mob",@"Adress",nil];
    
    NSLog(@"Employee Fields : %@",employeeFields);
    
     //Creates an array object employee fields values
    employeeObject1 = [[NSMutableArray alloc]initWithObjects:@"NR145",@"Meheboob",@"Nadaf",@"CEO",@"15/06/1993",@"8792269791",@"Ghataprabha-5600", nil];
    
    NSLog(@"Empoloyee Details %@: ",employeeObject1);
    
    //Creates an array object employee fields values
    employeeObject2 = [[NSMutableArray alloc]initWithObjects:@"NR146",@"Raghu",@"Dattawad",@"Manager",@"19/09/1991",@"9972616495",@"Belgaum-560010", nil];
    
    NSLog(@"Empoloyee Details %@: ",employeeObject2);
    
    //Creates an array object employee fields values
    employeeObject3 = [[NSMutableArray alloc]initWithObjects:@"NR147",@"Bhagyashree",@"Kandakur",@"Team Leader",@"15/07/1991",@"9915511420",@"Mudhol-560420", nil];
    
    NSLog(@"Empoloyee Details %@: ",employeeObject3);
    
    //Creates an array object employee fields values
    employeeObject4 = [[NSMutableArray alloc]initWithObjects:@"NR148",@"Bhaskar",@"NS",@"SoftawareEngineer",@"18/06/1990",@"9910564143",@"Bangalore-560010", nil];
    
      employeeObject5 = [[NSMutableArray alloc]initWithObjects:@"NR149",@"Harish",@"K",@"GM",@"14/02/1990",@"7795737288",@"Hasan-569900", nil];
    
    NSLog(@"Empoloyee Details %@: ",employeeObject5);
    
    ////Creates an MutableArray object to put all Employee Array Object
    allEmployeeObjects =[[NSMutableArray alloc]initWithObjects:employeeObject1,employeeObject2,employeeObject3,employeeObject4,employeeObject5, nil];
    
    NSLog(@"All Employee Objects : %@",allEmployeeObjects);
    
    //Creates Dictionary Object of Key Value pair for Employee1
    emp1Details = [[NSMutableDictionary alloc]initWithObjects:employeeObject1 forKeys:employeeFields];
   
    
    
    //Creates Dictionary Object of Key Value pair for Employee2
    emp2Details = [[NSMutableDictionary alloc]initWithObjects:employeeObject2 forKeys:employeeFields];
    
    NSLog(@"Employee Two Details : %@",emp2Details);
    
    //Creates Dictionary Object of Key Value pair for Employee3
    emp3Details = [[NSMutableDictionary alloc]initWithObjects:employeeObject3 forKeys:employeeFields];
    
    NSLog(@"Employee Three Details : %@",emp3Details);
    
    //Creates Dictionary Object of Key Value pair for Employee4
    emp4Details = [[NSMutableDictionary alloc]initWithObjects:employeeObject4 forKeys:employeeFields];
   
    NSLog(@"Employee Four Details : %@",emp4Details);
    
    
    //Creates Dictionary Object of Key Value pair for Employee4
    emp5Details = [[NSMutableDictionary alloc]initWithObjects:employeeObject4 forKeys:employeeFields];
    
    NSLog(@"Employee Four Details : %@",emp4Details);
    
    //Creates a mutable Array for All employee Key Value pairs
    allDictionaryObjectsInDictionary =[[NSMutableDictionary alloc]initWithObjectsAndKeys:emp1Details,@"1",emp2Details,@"2",emp3Details,@"3",emp4Details,@"4",emp5Details,@"5", nil];
    NSLog(@"Using allDictionaryObjectsInDictionary the values are : %@",allDictionaryObjectsInDictionary);

    //Putting dictionary in Array
    
    allEmployeeObjectInArray = [NSMutableArray arrayWithObjects:emp1Details,emp2Details,emp3Details,emp4Details,emp5Details, nil];
    
    //Changing Fileld Values
//    EmployeeIDLabel.text = [employeeObject3 objectAtIndex:0];
//    FirstNameLabel.text = [employeeObject3 objectAtIndex:1];
//    LastNameLabel.text  = [employeeObject3 objectAtIndex:2];
//    DesignitationLabel.text = [employeeObject3 objectAtIndex:3];
//    DOBLabel.text =[employeeObject3 objectAtIndex:4];
//    MobileNoLabel.text = [employeeObject3 objectAtIndex:5];
//    AdressLabel.text = [employeeObject3 objectAtIndex:6];
    
//    //Changing Value using Hardcoding
//    
//    DesignitationLabel.text = @"Team Leader";
//    
//    //Changing Place from string
//    placeOfEmployee = @"Ghataprabha";
//    AdressLabel.text  = placeOfEmployee;
//    
//    //Changing FirstNamre by using Array Object
//    FirstNameLabel.text =[employeeObject2 objectAtIndex:1];
//    
//    //Displaying LastName by using Dictionary
//    
//    AdressLabel.text = [emp3Details objectForKey:@"Adress"];
//    
//    //Changing Name By using Dictionary Inside Dictionary
//    DOBLabel.text = [[allDictionaryObjectsInDictionary objectForKey:@"2"] objectForKey:@"DOB"];
//    
//    
//    //Changing Name By using Dictionary within Array
//    MobileNoLabel.text = [[allEmployeeObjectInArray objectAtIndex:2]objectForKey:@"Mob"];
    
    //employeeDetailsPrint =1;
    
    
    
    int randomNumber = arc4random_uniform(4);
    NSLog(@"randomNumber %d",randomNumber);

    
    


    switch (randomNumber) {
        case 0:
            //Changing Fileld Value for Emp1
            EmployeeIDLabel.text = [employeeObject1 objectAtIndex:0];
            FirstNameLabel.text = [employeeObject1 objectAtIndex:1];
            LastNameLabel.text  = [employeeObject1 objectAtIndex:2];
            DesignitationLabel.text = [employeeObject1 objectAtIndex:3];
            DOBLabel.text =[employeeObject1 objectAtIndex:4];
            MobileNoLabel.text = [employeeObject1 objectAtIndex:5];
            AdressLabel.text = [employeeObject1 objectAtIndex:6];

            break;
        case 1:
            //Changing Fileld Value for Emp2
            EmployeeIDLabel.text = [employeeObject2 objectAtIndex:0];
            FirstNameLabel.text = [employeeObject2 objectAtIndex:1];
            LastNameLabel.text  = [employeeObject2 objectAtIndex:2];
            DesignitationLabel.text = [employeeObject2 objectAtIndex:3];
            DOBLabel.text =[employeeObject2 objectAtIndex:4];
            MobileNoLabel.text = [employeeObject2 objectAtIndex:5];
            AdressLabel.text = [employeeObject2 objectAtIndex:6];
            break;
        case 2:
            
            //Changing Fileld Value for Emp3
            EmployeeIDLabel.text = [employeeObject3 objectAtIndex:0];
            FirstNameLabel.text = [employeeObject3 objectAtIndex:1];
            LastNameLabel.text  = [employeeObject3 objectAtIndex:2];
            DesignitationLabel.text = [employeeObject3 objectAtIndex:3];
            DOBLabel.text =[employeeObject3 objectAtIndex:4];
            MobileNoLabel.text = [employeeObject3 objectAtIndex:5];
            AdressLabel.text = [employeeObject3 objectAtIndex:6];
            break;
        case 3:
            
            //Changing Fileld Value for Emp4
            EmployeeIDLabel.text = [employeeObject4 objectAtIndex:0];
            FirstNameLabel.text = [employeeObject4 objectAtIndex:1];
            LastNameLabel.text  = [employeeObject4 objectAtIndex:2];
            DesignitationLabel.text = [employeeObject4 objectAtIndex:3];
            DOBLabel.text =[employeeObject4 objectAtIndex:4];
            MobileNoLabel.text = [employeeObject4 objectAtIndex:5];
            AdressLabel.text = [employeeObject4 objectAtIndex:6];
            break;
            case 4:
            //Changing Fileld Value for Emp5
            EmployeeIDLabel.text = [employeeObject5 objectAtIndex:0];
            FirstNameLabel.text = [employeeObject5 objectAtIndex:1];
            LastNameLabel.text  = [employeeObject5 objectAtIndex:2];
            DesignitationLabel.text = [employeeObject5 objectAtIndex:3];
            DOBLabel.text =[employeeObject5 objectAtIndex:4];
            MobileNoLabel.text = [employeeObject5 objectAtIndex:5];
            AdressLabel.text = [employeeObject5 objectAtIndex:6];
            break;
        default:
            break;
    }
    
    
//    if (rand == 0) {
//        //Changing Fileld Value for Emp1
//        EmployeeIDLabel.text = [employeeObject1 objectAtIndex:0];
//        FirstNameLabel.text = [employeeObject1 objectAtIndex:1];
//        LastNameLabel.text  = [employeeObject1 objectAtIndex:2];
//        DesignitationLabel.text = [employeeObject1 objectAtIndex:3];
//        DOBLabel.text =[employeeObject1 objectAtIndex:4];
//        MobileNoLabel.text = [employeeObject1 objectAtIndex:5];
//        AdressLabel.text = [employeeObject1 objectAtIndex:6];
//        
//    }
//    
//    
//    if (rand == 1) {
//        
//    
//    NSLog(@"Project is Executed %i Time",employeeDetailsPrint);
//    //Changing Fileld Value for Emp1
//        EmployeeIDLabel.text = [employeeObject2 objectAtIndex:0];
//        FirstNameLabel.text = [employeeObject2 objectAtIndex:1];
//        LastNameLabel.text  = [employeeObject2 objectAtIndex:2];
//        DesignitationLabel.text = [employeeObject2 objectAtIndex:3];
//        DOBLabel.text =[employeeObject2 objectAtIndex:4];
//        MobileNoLabel.text = [employeeObject2 objectAtIndex:5];
//        AdressLabel.text = [employeeObject2 objectAtIndex:6];
//
//    }
//    if (rand == 2) {
//        
//        
//        NSLog(@"Project is Executed %i Time",employeeDetailsPrint);
//        //Changing Fileld Value for Emp1
//        EmployeeIDLabel.text = [employeeObject3 objectAtIndex:0];
//        FirstNameLabel.text = [employeeObject3 objectAtIndex:1];
//        LastNameLabel.text  = [employeeObject3 objectAtIndex:2];
//        DesignitationLabel.text = [employeeObject3 objectAtIndex:3];
//        DOBLabel.text =[employeeObject3 objectAtIndex:4];
//        MobileNoLabel.text = [employeeObject3 objectAtIndex:5];
//        AdressLabel.text = [employeeObject3 objectAtIndex:6];
//        
//    }
//    
//    
//    if (rand == 3) {
//        
//        
//        NSLog(@"Project is Executed %i Time",employeeDetailsPrint);
//        //Changing Fileld Value for Emp1
//        EmployeeIDLabel.text = [employeeObject4 objectAtIndex:0];
//        FirstNameLabel.text = [employeeObject4 objectAtIndex:1];
//        LastNameLabel.text  = [employeeObject4 objectAtIndex:2];
//        DesignitationLabel.text = [employeeObject4 objectAtIndex:3];
//        DOBLabel.text =[employeeObject4 objectAtIndex:4];
//        MobileNoLabel.text = [employeeObject4 objectAtIndex:5];
//        AdressLabel.text = [employeeObject4 objectAtIndex:6];
//        
//    }
//
//     if (rand == 4) {
//        
//        
//        NSLog(@"Project is Executed %i Time",employeeDetailsPrint);
//        //Changing Fileld Value for Emp1
//        EmployeeIDLabel.text = [employeeObject5 objectAtIndex:0];
//        FirstNameLabel.text = [employeeObject5 objectAtIndex:1];
//        LastNameLabel.text  = [employeeObject5 objectAtIndex:2];
//        DesignitationLabel.text = [employeeObject5 objectAtIndex:3];
//        DOBLabel.text =[employeeObject5 objectAtIndex:4];
//        MobileNoLabel.text = [employeeObject5 objectAtIndex:5];
//        AdressLabel.text = [employeeObject5 objectAtIndex:6];
//        
//    }
//
//    
//  
//    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
