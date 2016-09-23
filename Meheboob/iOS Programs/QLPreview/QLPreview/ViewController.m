//
//  ViewController.m
//  QLPreview
//
//  Created by Mahaboobsab Nadaf on 23/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{

    NSArray *arrayOfDocuments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrayOfDocuments = [[NSArray alloc] initWithObjects:
                        @"iOSDevTips.png", @"Remodel.xls", @"Core J2ME Technology.pdf",@"Cloudy.jpeg", nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return arrayOfDocuments.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [arrayOfDocuments objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // When user taps a row, create the preview controller
    QLPreviewController *previewer = [[QLPreviewController alloc] init] ;
    
    // Set data source
    [previewer setDataSource:self];
    
    // Which item to preview
    [previewer setCurrentPreviewItemIndex:indexPath.row];
    
    // Push new viewcontroller, previewing the document
    [[self navigationController] pushViewController:previewer animated:YES];
}

- (id <QLPreviewItem>)previewController: (QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    // Break the path into it's components (filename and extension)
    NSArray *fileComponents = [[arrayOfDocuments objectAtIndex: index] componentsSeparatedByString:@"."];
    
    // Use the filename (index 0) and the extension (index 1) to get path
    NSString *path = [[NSBundle mainBundle] pathForResource:[fileComponents objectAtIndex:0] ofType:[fileComponents objectAtIndex:1]];
    
    return [NSURL fileURLWithPath:path];
}
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return [arrayOfDocuments count];
}
@end