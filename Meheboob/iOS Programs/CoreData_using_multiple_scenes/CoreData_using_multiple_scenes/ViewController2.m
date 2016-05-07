//
//  ViewController2.m
//  CoreData_using_multiple_scenes
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2{

    ViewController*VC1;
    NSManagedObjectContext *context;
    AppDelegate *App;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    

    
    self.empName = [[NSString alloc]init];
     self.empDes = [[NSString alloc]init];
     self.empAge = [[NSString alloc]init];
     self.empGen = [[NSString alloc]init];
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

- (IBAction)saveButton:(id)sender {
    self.empName = self.nameTextFleld.text;
        self.empDes = self.designationTextField.text;
    self.empAge = self.ageTextField.text;
    self.empGen = self.genderTextField.text;
    

    
   
   context = [self getContext];
    
  NSManagedObject *employee =   [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    
    
    [employee setValue:self.empName forKey:@"name"];
     [employee setValue:self.empDes forKey:@"designation"];
     [employee setValue:[NSNumber numberWithInt:self.empAge.intValue] forKey:@"age"];
    [employee setValue:self.empGen forKey:@"gender"];
    
    
    NSError *error = nil;
    if ([context save:&error]) {
        NSLog(@"Saved Data");
    }
    else{
        NSLog(@"Failed to store data");
    
    }
    
    
   
    
    
   NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
 
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];
   // NSLog(@"core data Object : %@",self.coreObject);
    [VC1.myTableView reloadData];
   // [VC1 callMe];
    
    
}






-(NSManagedObjectContext *)getContext{
    
   App = [UIApplication sharedApplication].delegate;
context =   App.managedObjectContext;
    
    return context;
}

-(void)willMoveToParentViewController:(UIViewController *)parent{

    NSLog(@"Inside parant view Controller");
    
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];
    if (!parent) {
        NSLog(@"Back button pressed");
        
        // it can be useful to store this into a BOOL property
   

        [VC1 viewDidLoad];
    }
    [VC1.myTableView reloadData];
}

@end
