//
//  ViewController.m
//  GettingValuesFromJSONAndStroingIntoCoreData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "model.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic,strong) NSDictionary *jsonDictionary;

@property (nonatomic,strong) NSArray *array;
@property(nonatomic,strong) NSMutableArray *informationArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.informationArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *modelObject=self.informationArray[indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[modelObject valueForKey:@"artistName"];
    cell.detailTextLabel.text=[modelObject valueForKey:@"trackName"];
    return cell;
    
}
- (IBAction)delete:(id)sender {
    
    
    
}
- (IBAction)SaveJSON:(id)sender {
    
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    NSString *url=@"https://itunes.apple.com/search?term=apple&media=software";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * data, NSURLResponse *response, NSError *error){
        NSError *errorParsing=nil;
        if (error==nil) {
            
            [self fetchData];
            NSLog(@"%lu",(unsigned long)[self.informationArray count]);
            NSLog(@"%@",_informationArray);
            if ([self.informationArray count] !=0) {
                
                
                [self.tableView reloadData];
                [self.activityIndicator stopAnimating];
                [self.activityIndicator setHidesWhenStopped:YES];
                
            }
            else
            {
                
                self.jsonDictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:&errorParsing];
                
                if (errorParsing==nil) {
                    
                    self.array=[_jsonDictionary valueForKey:@"results"];
                    
                    NSManagedObjectContext *context=[self getContext];
                   
                    for (NSDictionary *dict in self.array) {
                         NSManagedObject *object=[NSEntityDescription insertNewObjectForEntityForName:@"Information" inManagedObjectContext:context];
                        NSString *nme=[dict valueForKey:@"artistName"];
                        NSString *track=[dict valueForKey:@"trackName"];
                        
                        [object setValue:nme forKey:@"artistName"];
                        [object setValue:track forKey:@"trackName"];
                        
                        if ([context save:&error]) {
                            NSLog(@"saved Successfully");
                            //[self.tableView reloadData];
                        }
                        //[];
                    }
                    [self.tableView reloadData];
                }
                [self.activityIndicator stopAnimating];
                [self.activityIndicator setHidesWhenStopped:YES];
            }
        }
    }];
    [dataTask resume];
}


-(NSManagedObjectContext*)getContext
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context= [app managedObjectContext];
    return context;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.activityIndicator setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)fetchData
{
    NSManagedObjectContext *context=[self getContext];
    
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Information"];
    NSError *error1=nil;
    
    self.informationArray =[[NSMutableArray alloc]initWithArray:[context executeFetchRequest:fetch error:&error1]];
}
@end
