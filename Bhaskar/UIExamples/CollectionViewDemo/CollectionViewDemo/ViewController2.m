//
//  ViewController2.m
//  CollectionViewDemo
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSString *topicDetails;

@property (nonatomic,strong) NSArray *books,*sports;

@property (nonatomic,strong) NSDictionary *dict;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.books=[[NSArray alloc]initWithObjects:@"Kannada",@"English",@"Hindi",@"Telugu",@"Tamil", nil];
    self.sports=[[NSArray alloc]initWithObjects:@"Cricker",@"Foot Ball",@"Hockey",@"Kabadi", nil];
    
    self.dict=[[NSDictionary alloc]initWithObjectsAndKeys:
               self.books,@"Books",
               self.sports,@"Sports",nil];
    self.navigationItem=[[UINavigationItem alloc]initWithTitle:self.topicDetails];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *toReturn=[self.dict valueForKey:_topicDetails];
    
    return [toReturn count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    
    NSArray *getDetails=[self.dict valueForKey:self.topicDetails];
    
    cell.textLabel.text=getDetails [indexPath.row];
    return cell;
}

-(void)receiveTopicDetails:(NSString *)selcetedTopic
{
    self.topicDetails=selcetedTopic;
}
@end
