//
//  ViewController2.m
//  CustomPickerViewUsingTabelView
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

#import "TabelCell.h"
@interface ViewController2 ()



@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    self.gettingGender=[[NSMutableArray alloc]init];
    self.gettingCountry=[[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)receivedAllDetails:(NSMutableArray *)recfieldcountry :(NSMutableArray*)recgender
{
    self.gettingCountry =recfieldcountry;
    self.gettingCountry=recgender;

    
    NSLog(@" received name and Country %@ %@", self.gettingCountry,self.gettingGender);

}

-(void)receivednameandGender:(NSString *)enteredFieldname :(NSString *)entererdage
{

    self.enteredFieldname=enteredFieldname;
    self.entererdage=entererdage;

    NSLog(@"NAme and geender %@ %@",self.enteredFieldname,self.entererdage );
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
        return 1;


}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{

    
    TabelCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.nameLabel.text=[NSString stringWithFormat:@"%@",self.enteredFieldname];
    
    cell.ageLabel.text=[NSString stringWithFormat:@"%@",self.entererdage];
                   
    cell.genderLabel.text=[NSString stringWithFormat:@"%@",self.gettingGender];
     cell.countryLabel.text=[NSString stringWithFormat:@"%@",self.gettingCountry];
    
   

    return cell;

}
@end
