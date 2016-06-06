//
//  ViewController.m
//  LocalizeMe
//
//  Created by Mahaboobsab Nadaf on 02/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *localeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSLocale *locale = [NSLocale currentLocale];
    NSString *curremtLangID = [[NSLocale preferredLanguages]objectAtIndex:0];
    NSString *displayLang = [locale displayNameForKey:NSLocaleLanguageCode value:curremtLangID];
    NSString *capitalized = [displayLang capitalizedStringWithLocale:locale];
    self.localeLabel.text = capitalized;
    
    [self.labels[0] setText: NSLocalizedString(@"LABEL_ONE", @"The number 1")];
    [self.labels[1] setText: NSLocalizedString(@"LABEL_TWO", @"The number 2")];
    [self.labels[2] setText: NSLocalizedString(@"LABEL_THREE", @"The number 3")];
    [self.labels[3] setText: NSLocalizedString(@"LABEL_FOUR", @"The number 4")];
    [self.labels[4] setText: NSLocalizedString(@"LABEL_FIVE", @"The number 5")];
    NSString *flagFile = NSLocalizedString(@"FLAG_FILE", @"Name of flag");
    self.flagImageView.image = [UIImage imageNamed:flagFile];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
