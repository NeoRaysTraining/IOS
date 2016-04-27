//
//  ViewController2ViewController.m
//  TabelViewMultipleScene
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2ViewController.h"
#import "TableViewCell.h"
@interface ViewController2ViewController ()

@end

@implementation ViewController2ViewController

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
-(void)getImage :(NSString*)receiveImage{

    self.thisClassImage=receiveImage;
    NSLog(@" receive image %@",self.thisClassImage);


}

-(void)receiveAllDetails:(NSArray*)list1 :(NSMutableArray *)list2
{


    
    self.thisClassArray=list1;
    
    self.receivedNames=list2;
    
    
    NSLog(@" receive All deet %@",self.thisClassArray);
    NSLog(@" receive  names deet %@",self.receivedNames);

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    cell.firstName.text=[NSString stringWithFormat:@"%@",[self.receivedNames objectAtIndex:0]];
    
     cell.lastName.text=[NSString stringWithFormat:@"%@",[self.receivedNames objectAtIndex:1]];
    
     cell.AddressLabel.text=[NSString stringWithFormat:@"%@",[self.receivedNames objectAtIndex:2]];
    
    
    
     cell.phoneNum.text=[NSString stringWithFormat:@"%@",[self.receivedNames objectAtIndex:3]];
    
    
    cell.imageField.image=[UIImage imageNamed:self.thisClassImage];
    
    return cell;
    

}








@end
