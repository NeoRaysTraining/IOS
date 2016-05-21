//
//  MTViewController.m
//  NSURLSessionAndSearch
//
//  Created by test on 21/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "MTViewController.h"
#import "MWFeedParser.h"
#import "SVProgressHUD.h"

@interface MTViewController ()
@property(strong, nonatomic)NSDictionary *podcast;
@property(strong, nonatomic)NSMutableArray *episodes;
@property(strong, nonatomic)MWFeedParser *feedParser;
@end

@implementation MTViewController

static NSString *SearchCell = @"SearchCell";
static NSString *EpisodeCell = @"EpisodeCell";

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
-(void)setPodcast:(NSDictionary *)podcast{
    
    if (self.podcast != podcast) {
        self.podcast = podcast;
        
        //Update View
        
        [self updateView];
        
        //fetch And ParseFeed
        
        [self fetchAndParseFeed];
    }
    
}

-(void)updateView{
    
    //Update View
    
    self.title = [self.podcast objectForKey:@"collectionName"];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"MTPodcast"]) {
        self.podcast = [object objectForKey:@"MTPodcast"];
    }
}

-(void)dealloc{
    
    [[ NSUserDefaults standardUserDefaults]removeObserver:self forKeyPath:@"MTPodcast"];
    
}

-(void)fetchAndParseFeed{
    
    if (!self.podcast)return;
    
    NSURL *url = [NSURL URLWithString:[self.podcast objectForKey:@"feedUrl"]];
    
    if (!url)return;
    
    if (self.feedParser) {
        [ self.feedParser stopParsing];
        
        [self.feedParser setDelegate:nil];
        
        [self setFeedParser:nil];
    }
    
    //Clear Episodes
    
    if (self.episodes) {
        [self setEpisodes:nil];
    }
    
    //Initialize Feed Parses
    
    self.feedParser = [[MWFeedParser alloc]initWithFeedURL:url];
    
    //Configure Feed Parser
    
    [self.feedParser setFeedParseType:ParseTypeFull];
    
    //[self.feedParser setDelegate:self];
    
    //Show Progress HUD
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
    [self.feedParser parse];
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    
    
    if (!self.episodes) {
        self.episodes = [NSMutableArray array];
    }
    
    [self.episodes addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {
    
    //Dismiss progress  HUD
    
    [SVProgressHUD dismiss];
    
    //Update Table View
    
    [self.myTableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return self.episodes ? 1 : 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.episodes ? self.episodes.count : 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EpisodeCell forIndexPath:indexPath];
    
    //Fetch Feed Item
    
    MWFeedInfo *feedItem = [self.episodes objectAtIndex:indexPath.row];
    
    //Configure Table View Cell
    
    [cell.textLabel setText:feedItem.title];
    
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@",feedItem.title]];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;

}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{

    return NO;

}
@end
