//
//  DependentComponentPickerViewController.m
//  PickerAndTabBarDemo
//
//  Created by test on 8/4/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

#define kDevelopmentComponent 0
#define kDeveloperComponent 1

@interface DependentComponentPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>


@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;

@property (strong,nonatomic) NSDictionary *company;

@property (strong,nonatomic) NSArray *developmentTeam;

@property (strong,nonatomic) NSArray *developerNames;
@end

@implementation DependentComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *ios=[[NSArray alloc]initWithObjects:@"Bhaski",@"nadaf",@"raghu",@"bhagya",@"hari", nil];
    
    NSArray *android=[[NSArray alloc]initWithObjects:@"sagar",@"archana",@"khadeer",@"mahima",@"sameer", nil];
    
    NSArray *java=[[NSArray alloc]initWithObjects:@"channu",@"bhagya",@"divya",@"vedha",@"mahabaleshwar", nil];
    
    NSArray *hr=[[NSArray alloc]initWithObjects:@"thanu",@"sangeeth",@"shantheri",@"Amaresh",@"Amith", nil];
    
     self.company=[[NSDictionary alloc]initWithObjectsAndKeys:ios,@"IOS",android,@"ANDROID",java,@"JAVA",hr,@"HR",nil];
    NSArray *allTeams=[self.company allKeys];
    NSArray *teams=[allTeams sortedArrayUsingSelector:@selector(compare:)];
    self.developmentTeam=teams;
    NSLog(@"%@",_developmentTeam);
    NSString *selectedTeam=self.developmentTeam[0];
    self.developerNames=self.company[selectedTeam];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectAction:(id)sender {
    
    NSInteger developmentRow = [self.pickerViewOutlet
                          selectedRowInComponent:kDevelopmentComponent];
    NSInteger developerNameRow = [self.pickerViewOutlet
                        selectedRowInComponent:kDeveloperComponent];
    NSString *developmentTeamStr = self.developmentTeam[developmentRow];
    NSString *developerNameStr = self.developerNames[developerNameRow];
    
    NSString *title = [[NSString alloc] initWithFormat:@"%@", developmentTeamStr];
    NSString *message = [[NSString alloc] initWithFormat:
                         @"%@ is in %@", developmentTeamStr, developerNameStr];
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark delegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
    
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component == kDevelopmentComponent) {
        return [self.developmentTeam count];
    } else {
        return [self.developerNames count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==kDevelopmentComponent) {
        return self.developmentTeam[row];
    }
    else
    {
        return self.developerNames[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==kDevelopmentComponent) {
        NSString *selectedTeam = self.developmentTeam[row];
        self.developerNames = self.company[selectedTeam];
        [self.pickerViewOutlet reloadComponent:kDeveloperComponent];
        [self.pickerViewOutlet selectRow:0
                            inComponent:kDeveloperComponent
                               animated:YES];
    }
}

@end
