//
//  ViewController.m
//  VideoPlayer
//
//  Created by Meheboob Nadaf on 19/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)webVideo:(id)sender {
    
    [self performSegueWithIdentifier:@"web" sender:self];
}

- (IBAction)play:(id)sender {
    

    
    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"AURORA - Nature Boy" withExtension:@"mp4"];
    
 
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self presentViewController:playerViewController animated:YES completion:nil];
    

}

- (IBAction)remoteVideo:(id)sender {
    
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self presentViewController:playerViewController animated:YES completion:nil];
}
@end
