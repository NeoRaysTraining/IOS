//
//  ViewController.m
//  DownloadAndFetchData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ModelClass.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;
@property (nonatomic,strong)NSMutableArray *artistArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)download:(id)sender {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        if(error==nil)
        {
            [self fetchData];
            NSLog(@"%lu",_artistArray.count);
            if([_artistArray count]==0)
            {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@",json);
                
                NSArray *array=[json valueForKey:@"results"];
                NSManagedObjectContext *context = [self getcontext];

                for (NSDictionary *dict in array) {
                    NSManagedObject *file = [NSEntityDescription insertNewObjectForEntityForName:@"File" inManagedObjectContext:context];
                    [file setValue:[dict valueForKey:@"artistName"] forKey:@"name"];
                    [file setValue:[dict valueForKey:@"trackName"] forKey:@"track"];
                    NSError *error1=nil;
                    
                    if ([context save:&error1]) {
                        NSLog(@"Data saved successfully");
                        [self.tableViewOutlet reloadData];
                    }
                    else
                    {
                        NSLog(@"Not saved");
                    }
                }
                

            }
            else{
                [self.tableViewOutlet reloadData];
            }
        }
    }];
    [dataTask resume];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artistArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSManagedObject *model = self.artistArray [indexPath.row];
    cell.textLabel.text=[model valueForKey:@"name"];
    cell.detailTextLabel.text=[model valueForKey:@"track"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)getcontext
{
    AppDelegate *app =[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context =app.managedObjectContext;
    return context;
}

-(void)fetchData
{
    NSManagedObjectContext *context = [self getcontext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"File"];
    NSError *error =nil;
    _artistArray = [[NSMutableArray alloc]initWithArray: [context executeFetchRequest:request error:&error]];
    }

@end
