//
//  ViewController.m
//  LocalizeMe
//
//  Created by test on 6/2/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *localeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImage;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLocale *locale = [NSLocale currentLocale];
    NSString *currentLangID = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *displayLang = [locale displayNameForKey:NSLocaleLanguageCode value:currentLangID];
    NSString *capitalized = [displayLang capitalizedStringWithLocale:locale];
    self.localeLabel.text = capitalized;
    [self.labels[0] setText:NSLocalizedString(@"LABEL_ONE", @"The number 1")];
    [self.labels[1] setText:NSLocalizedString(@"LABEL_TWO", @"The number 2")];
    [self.labels[2] setText:NSLocalizedString(@"LABEL_THREE",
                                              @"The number 3")];
    [self.labels[3] setText:NSLocalizedString(@"LABEL_FOUR", @"The number 4")];
    [self.labels[4] setText:NSLocalizedString(@"LABEL_FIVE", @"The number 5")];
    NSString *flagFile = NSLocalizedString(@"FLAG_FILE", @"Name of the flag");
    self.flagImage.image = [UIImage imageNamed:flagFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
