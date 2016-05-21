//
//  ViewController.m
//  NSURLSessionAndSearch
//
//  Created by test on 20/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property(strong, nonatomic)NSMutableArray *podcasts;
//@property(strong, nonatomic)NSDictionary *podcast;

@end

@implementation ViewController

static NSString *SearchCell = @"SearchCell";
//static NSString *EpisodeCell = @"EpisodeCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Load Podcast
    [self loadPodcast];
    
    // Add Observer
    
    [[NSUserDefaults standardUserDefaults]addObserver:self forKeyPath:@"MTPodcast" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return  self.podcasts ? 1 : 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.podcasts ? self.podcasts.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SearchCell forIndexPath:indexPath];

    //Fetch podcast
    NSDictionary *podcast = [self.podcasts objectAtIndex:indexPath.row];
    
    //Configure TableView cell
    
    [cell.textLabel setText:[podcast objectForKey:@"collectionName"]];
    
    [cell.detailTextLabel setText:[podcast objectForKey:@"artistName"]];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return NO;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{

    return NO;
}

//-(NSURLSession *)session{
//
//    if (!_session) {
//        
//        //Initialize Session Configuration
//        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        
//        //Configure Session Configuaration
//     
//        [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
//        
//        //Initialize Session
//        
//        self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
//    }
//
//    return self.session;
//}

- (NSURLSession *)session {
    if (!_session) {
        // Initialize Session Configuration
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        // Configure Session Configuration
        [sessionConfiguration setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json" }];
        
        // Initialize Session
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    }
    
    return _session;
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    if (!searchText)return;
    
    if (searchText.length <= 3) {
        [self resetSearch];
    }
    
    else{
    
        [self performSearch];
    }
}


-(void)resetSearch{

    //Update data Source
    
    [self.podcasts removeAllObjects];

    //Update Table View
    
    [self.myTableview reloadData];
}

-(void)performSearch{

    NSString *query = self.searchBar.text;
    
    if (_dataTask) {
        [self.dataTask cancel];
    }

    self.dataTask = [self.session dataTaskWithURL:[self urlForQuery : query]completionHandler:^(NSData *data, NSURLResponse *response , NSError *error){
    
        if (error) {
            
            if (error.code != -999) {
                NSLog(@"%@",error);
            }
            
            
            else{
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                NSArray *results = [result objectForKey:@"results"];
            
                dispatch_async(dispatch_get_main_queue(), ^{
                
                
                    if (results) {
                        [self processResults:results];
                    }
                
                });
            
            }
        }
    
        
    }];
    
    if (self.dataTask) {
        [self.dataTask resume];
    }
}



-(void)processResults : (NSArray *)results{

    if (!self.podcasts) {
        self.podcasts = [NSMutableArray array];
    }


    //Updates Data Source
    
    [self.podcasts removeAllObjects];
    
    [self.podcasts addObjectsFromArray:results];
    
    //Update Table View
    
    [self.myTableview reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //Fetch podcast
    
    NSDictionary *podcast = [self.podcasts objectAtIndex:indexPath.row];
    
    //Update UserDepaults
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    [ud setObject:podcast forKey:@"MTPodcast"];
    
    [ud synchronize];
    
    //Dismiss viewController
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)viewDidAppear:(BOOL)animated{


    [super viewDidAppear:animated];
    
    [self.searchBar becomeFirstResponder];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{


    if ([self.searchBar isFirstResponder]) {
        [self.searchBar resignFirstResponder];
    }
}




-(NSURL *)urlForQuery : (NSString *)query{

    query = [query stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    return [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/search?media=podcast&entity=podcast&term=%@",query]];
}


-(void)loadPodcast{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];

    self.podcasts = [ud objectForKey:@"MTPodcast"];
}


//-(void)setPodcast:(NSDictionary *)podcast{
//
//    if (self.podcast != podcast) {
//        self.podcast = podcast;
//        
//        //Update View
//        
//        [self updateView];
//        
//        //fetch And ParseFeed
//        
//        [self fetchAndParseFeed];
//    }
//
//}
//
//-(void)updateView{
//    
//    //Update View
//    
//    self.title = [self.podcast objectForKey:@"collectionName"];
//
//}
//
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
//
//    if ([keyPath isEqualToString:@"MTPodcast"]) {
//        self.podcast = [object objectForKey:@"MTPodcast"];
//    }
//}
//
//-(void)dealloc{
//
//    [[ NSUserDefaults standardUserDefaults]removeObserver:self forKeyPath:@"MTPodcast"];
//
//}
//
//-(void)fetchAndParseFeed{
//    
//    if (!self.podcast)return;
//    
//    NSURL *url = [NSURL URLWithString:[self.podcast objectForKey:@"feedUrl"]];
//    
//    if (!url)return;
//    
//    if (self.feedParser) {
//        [ self.feedParser stopParsing];
//        
//        [self.feedParser setDelegate:nil];
//        
//        [self setFeedParser:nil];
//    }
//    
//    //Clear Episodes
//    
//    if (self.episodes) {
//        [self setEpisodes:nil];
//    }
//    
//    //Initialize Feed Parses
//    
//    self.feedParser = [[MWFeedParser alloc]initWithFeedURL:url];
//    
//    //Configure Feed Parser
//    
//    [self.feedParser setFeedParseType:ParseTypeFull];
//    
//    [self.feedParser setDelegate:self];
//    
//    //Show Progress HUD
//    
//  [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
//    
//    [self.feedParser parse];
//}
//- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
//
//
//    if (!self.episodes) {
//        self.episodes = [NSMutableArray array];
//    }
//    
//    [self.episodes addObject:item];
//}
//
//- (void)feedParserDidFinish:(MWFeedParser *)parser {
//
//    //Dismiss progress  HUD
//    
//    [SVProgressHUD dismiss];
//    
//    //Update Table View
//    
//    [self.myTableview reloadData];
//
//}
@end
