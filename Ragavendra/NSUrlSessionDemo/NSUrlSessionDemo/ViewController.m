//
//  ViewController.m
//  NSUrlSessionDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "Modal.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tabelview;
@property (nonatomic,strong)NSString  *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a
    
    NSURLSession *session = [NSURLSession sharedSession];
  self.modelArray=[[NSMutableArray alloc]init];

    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      
                                      {
NSError* errorparsing = nil;
   
if(error==nil){
self.jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorparsing];
    NSLog(@"json Values %@",self.jsonDict);

  if(errorparsing==nil)
{
self.jsonArray = [self.jsonDict valueForKey:@"result"];
  

for(NSDictionary *dict in self.jsonArray)
{
Modal* model = [[Modal alloc]initWithName:[dict valueForKey:@"artistName"] trackName:[dict valueForKey:@"trackName"]];
[self.modelArray addObject:model];
                                                                                   
  }
 }
}

                                                                               
}];
    
       [dataTask resume];
}
   
    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Modal* model = [self.modelArray objectAtIndex:indexPath.row];
    
        cell.textLabel.text = model.name;
        cell.detailTextLabel.text = model.track;
    NSLog(@"All keys %@",cell.textLabel.text);
    NSLog(@"All values %@",cell.detailTextLabel.text);
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
