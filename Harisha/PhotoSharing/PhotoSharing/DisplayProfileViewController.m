//
//  DisplayProfileViewController.m
//  PhotoSharing
//
//  Created by test on 7/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "DisplayProfileViewController.h"

@interface DisplayProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property(strong,nonatomic)NSDictionary* recivedDict;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSArray* jsonArray;

@property (strong,nonatomic)NSDictionary* apiValues;
@property(strong,nonatomic)NSString* accessToken;
@end

@implementation DisplayProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self receiveAccessToken];
    
    self.fullName.text = [self.recivedDict valueForKey:@"full_name"];
    
    self.userName.text = [self.recivedDict valueForKey:@"username"];
    
    self.userImage.layer.cornerRadius=50.0;
    
    NSURL *imageUrl = [NSURL URLWithString:[self.recivedDict valueForKey:@"profile_picture"]];
    NSData* imageData = [NSData dataWithContentsOfURL:imageUrl];
    
    self.userImage.image = [UIImage imageWithData:imageData];
    
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
-(void)receiveData:(NSDictionary *)data
{
    self.recivedDict = data;
    
    NSLog(@"received data %@",self.recivedDict);
    
}

-(void)receiveAccessToken
{
    NSString* newUrl = [NSString stringWithFormat:@"https://api.instagram.com/oauth/access_token"];
    NSLog(@"new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
                                      {
                                          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                          NSLog(@"%@",self.json);
                                      }
                                      ];
    
    [dataTask resume];

}
@end
