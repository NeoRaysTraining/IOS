//
//  InitialViewController.m
//  StockExchangeApplicationDemo
//
//  Created by test on 7/18/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "InitialViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"


@interface InitialViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableViewOutlet;

@property (strong,nonatomic) NSMutableDictionary *allRequiredValues;

@property (strong,nonatomic) NSMutableArray *differentCompanyJsonArray,*companyNames,*compExchangeDet,*lastPriceArray,*rateChange,*symbolArray;

@property (strong,nonatomic) NSDictionary *values;
@property (strong,nonatomic) NSUserDefaults *defaults;


@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.allRequiredValues=[NSMutableDictionary dictionary];
    self.differentCompanyJsonArray =[[NSMutableArray alloc]init];
    
    self.defaults=[NSUserDefaults standardUserDefaults];
    self.differentCompanyJsonArray=[[self.defaults objectForKey:@"mainArray"] mutableCopy];
    //[self.tableViewOutlet reloadData];
    [self settingValuesForPopulating:[self.defaults objectForKey:@"mainArray"]];
    
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

- (IBAction)addAtnAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveSymbol:) name:@"sendDataBack" object:nil];
    [self performSegueWithIdentifier:@"Search" sender:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"sendDataBack" object:nil];
   
//    if (self.differentCompanyJsonArray!=nil) {
//         NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//         self.differentCompanyJsonArray=[defaults objectForKey:@"mainArray"];
//        NSLog(@"%@",self.differentCompanyJsonArray);
//    }
   

}



-(void)settingValuesForPopulating:(NSArray *)values
{
    NSLog(@"%@",values);
    self.companyNames =[[NSMutableArray alloc]init];
    self.compExchangeDet=[[NSMutableArray alloc]init];
    self.lastPriceArray=[[NSMutableArray alloc]init];
    self.rateChange=[[NSMutableArray alloc]init];
    self.symbolArray=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in values) {
        NSString *name=[NSString stringWithFormat:@"%@",[dict valueForKey:@"name"]];
        NSLog(@"%@",name);
        NSString *exp=[NSString stringWithFormat:@"%@",[dict valueForKey:@"exchange"]];
        NSString *lastPrice=[NSString stringWithFormat:@"%@",[dict valueForKey:@"lastPrice"]];
        NSString *percentChange=[NSString stringWithFormat:@"%@",[dict valueForKey:@"percentChange"]];
        [self.symbolArray addObject:[dict valueForKey:@"symbol"]];
        NSLog(@"%@",[dict valueForKey:@"symbol"]);
        [self.compExchangeDet addObject:exp];
        [self.companyNames addObject:name];
        [self.lastPriceArray addObject:lastPrice];
        [self.rateChange addObject:percentChange];
    }
    NSLog(@"%@",self.companyNames);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableViewOutlet reloadData];
    });
    
}

-(void)receiveSymbol:(NSNotification *)notification
{
    
    NSString *sbl=[NSString stringWithFormat:@"%@",[[notification userInfo] valueForKey:@"symbol"]];
    NSLog(@"%@",sbl);
    
    [self.symbolArray addObject:sbl];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://marketdata.websol.barchart.com/getQuote.json?key=41607c271789941bd25037fab1b706ea&symbols=%@",sbl]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       NSLog(@"%@",json);
        
        double code=[[[json valueForKey:@"status"]valueForKey:@"code"] doubleValue];
        NSLog(@"%f",code);
        if (code == 204) {
            [self displayAlertView:@"Details Not Found"];
        }
        else{
            
            [self.differentCompanyJsonArray addObjectsFromArray:[json valueForKey:@"results"]];
            NSLog(@"%@",_differentCompanyJsonArray);
            
            [self.defaults setObject:self.differentCompanyJsonArray forKey:@"mainArray"];
            [self.defaults synchronize];
            
            
            [self settingValuesForPopulating:[self.defaults objectForKey:@"mainArray"]];

        }
        
        
    }];
    
    [dataTask resume];

    
}


#pragma mark Helper Method
-(void)displayAlertView:(NSString *)message
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Caution" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveSymbol:) name:@"sendDataBack" object:nil];
        [self performSegueWithIdentifier:@"Search" sender:self];

    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark uitableView Delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.companyNames count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    double rate=[[self.rateChange objectAtIndex:indexPath.row] doubleValue];
    cell.compName.text=[self.companyNames objectAtIndex:indexPath.row];
    cell.exchangeDet.text=[self.compExchangeDet objectAtIndex:indexPath.row];
    cell.currentPrice.text=[self.lastPriceArray objectAtIndex:indexPath.row];
    if (rate<0.0) {
        
        [cell.changeInrate setTextColor:[UIColor redColor]];
        cell.changeInrate.text=[NSString stringWithFormat:@"%.02f %%",rate];
        [cell.graphImg setImage:[UIImage imageNamed:@"decrease"]];
    }
    else
    {
        [cell.changeInrate setTextColor:[UIColor greenColor]];
        cell.changeInrate.text=[NSString stringWithFormat:@"%.02f %%",rate];
        [cell.graphImg setImage:[UIImage imageNamed:@"increase"]];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return self.headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%@",self.differentCompanyJsonArray);
    NSLog(@"%ld",indexPath.row);
    self.values=[self.differentCompanyJsonArray objectAtIndex:indexPath.row];
    NSLog(@"%@",self.values);
    [self performSegueWithIdentifier:@"detailView" sender:self];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.differentCompanyJsonArray removeObjectAtIndex:indexPath.row];
    [self.companyNames removeObjectAtIndex:indexPath.row];
    [self.compExchangeDet removeObjectAtIndex:indexPath.row];
    [self.rateChange removeObjectAtIndex:indexPath.row];
    [self.lastPriceArray removeObjectAtIndex:indexPath.row];
    [self.symbolArray removeObjectAtIndex:indexPath.row];
    [self.tableViewOutlet reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailView"]) {
        
        DetailViewController *dvc=[segue destinationViewController];
        [dvc receiveData:self.values];
    }
}

@end
