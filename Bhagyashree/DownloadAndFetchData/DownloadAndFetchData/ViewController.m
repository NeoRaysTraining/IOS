//
//  ViewController.m
//  DownloadAndFetchData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (nonatomic,strong)NSString *urlstr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)download:(id)sender {
    
    _urlstr=@"https://itunes.apple.com/search?term=apple&media=software";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:_urlstr]completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        NSDictionary *first =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",first);
    }];
    [dataTask resume];
    
    
    NSManagedObjectContext *context = [self getcontext];
    NSManagedObject *file = [NSEntityDescription insertNewObjectForEntityForName:@"File" inManagedObjectContext:context];
    [file setValue:_urlstr forKey:@"url"];
    NSError *error = nil;
    
    if(![context save:&error])
    {
        NSLog(@"Data not Saved");
    }
    else
    {
        NSLog(@"Data saved");
        NSLog(@"%@",[file valueForKey:@"url"]);
    }
    

//    UIAlertController *alertController = [UIAlertController
//                                          alertControllerWithTitle:@"Downloaded Sucessfully"
//                                          message:@""
//                                          preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
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

@end
