//
//  FeatureTableViewController.m
//  Cluster
//
//  Created by test on 16/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "FeatureTableViewController.h"

@interface FeatureTableViewController ()

@end

@implementation FeatureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.whyCluster = [[NSArray alloc]initWithObjects:@"Training done by a single trainer Mr. Ravi Kumar Hadagli who is having 15 years of experience in Java / Jee",@"Mr. Ravi Kumar Hadagali has completed Java exams on OCJP / SCJP, OCPJWCD / SCWCD",@"Mr. Ravi Kumar Hadagali has written 11 fast selling books Core Java, Advanced Java, database, JDBC, Servlet, JSP, JSF, Spring and hibernate, EJB and Web Service",@"Classes taken in a simple flow understood by people from both Computer & Non Computer backgrounds",@"Morning Evening & Weekend classes available at students convenient and flexible timing",@"HD-Video Backup available for missed classes",@"Live projects are developed & integrated under the guidance of Project Managers of reputed firms",@"We provide notes and training material to studets",@"Only institute having in depth syllabus to prepare you for international certification exams - OCPJP / SCJP, OCPJWCD / SCWCD , OCPJBCD / SCBCD", nil];
    
    self.VideoCoaching = [[NSArray alloc]initWithObjects:@"Learn JAVA at your convenient timings : Morning/Evening/Weekends",@"Repeat any class, any time",@"Best suited for manual testers who want to learn JAVA for selenium testing",@"Learn Java in fast track courses (1 month / 2 months / 3 months)",@"Best suited for college students to strengthen their skill set in java / JEE",@"Best infrastructure with LED monitors provided for streaming Full HD videoes", nil];
    
    self.finalYear = [[NSArray alloc]initWithObjects:@"For B.E / B.Tech, M.E / M.Tech ,M.Sc, M.C.A , B.Sc, B.C.A, Diploma",@"Domains like Networking, Cloud Computing, Mobile, Android etc", nil];
    
    self.someMNC = [[NSArray alloc]initWithObjects:@"Tech Mahindra",@"Symphony telica",@"MISYS",@"WEBCETERA",@"Rev Tech",@"AMPLE",@"JMR",@"SPAN Infotech",@"ims health",@"GREYTIP", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.numberOfLines = 4;
    cell.textLabel.textColor = [UIColor blueColor];
    
    
    if ([indexPath section] == 0) {
        
     
        cell.textLabel.text = [self.whyCluster objectAtIndex:indexPath.row];
        
    }
    
    else  if ([indexPath section] == 1) {
       cell.textLabel.text = [self.VideoCoaching objectAtIndex:indexPath.row];
        
    }
    
    else  if ([indexPath section] == 2) {
      cell.textLabel.text = [self.finalYear objectAtIndex:indexPath.row];
        
    }
    else{
     cell.textLabel.text = [self.someMNC objectAtIndex:indexPath.row];
    }
    

    
    return cell;
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
    
}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return self.whyCluster.count;
    }
    else if (section == 1) {
        return self.VideoCoaching.count;
    }
    else if (section == 2) {
        return self.finalYear.count;
    }
    else{
        
        return self.someMNC.count;
    }
    
}



- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return @"Why Course at Cluster?";
    }
    
    else if (section == 1) {
        return @"Video Coaching (New)";
    }
    
    else if (section == 2) {
        return @"Funal Year IEEE and Internship Projects";
    }
    else{
        return @"Some of our esteemed MNC clients";
        
    }
    
}
















@end
