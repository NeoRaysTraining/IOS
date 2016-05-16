//
//  ViewController.m
//  Cluster
//
//  Created by test on 15/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    
    
    
    
    Modules *module1First = [Modules new];
    module1First.name = @"1.  Java Basics and Core Java";
    module1First.imageFile = @"Java Basics";
    module1First.duration = @"30 Days";
    module1First.contents = [NSArray arrayWithObjects:@"Intro to OOPS - Abstraction, Polymorphism, Inheritance, Encapsulation",@"Introduction and History of Java",@"Java Installation",@"Path and Classpath Setting",@"JVM Architecture",@"Java Keywords",@"Basic Data Types",@"Type Casting",@"Arrays",@"Literals",@"oparations",@"Control Statements",@"Static and Instance Variables",@"Static and Instance Variables",@"Static and Instance Block",@"Static and Instance Method",@"Constructor and Constructor chaining",@"Access Specifiers and Modifiers",@"packages",@"Exception Handling",@"Multithreading", nil];
    
    Modules *module1Second = [Modules new];
    module1Second.name = @"2.  Advanced Java";
    module1Second.imageFile = @"Advanced Java";
    module1Second.duration = @"10 Days";
    module1Second.contents = [NSArray arrayWithObjects:@"Reflection",@"Cloning",@"Memory management & Garbage Collector",@"Regulor Expression(Regex)",@"Pattern making and matching", nil];
    
    Modules *module1Third = [Modules new];
    module1Third.name = @"  Java Packages";
    module1Third.imageFile = @"Java Packages";
    module1Third.duration = @"15 Days";
    module1Third.contents = [NSArray arrayWithObjects:@"LANG  : Class, Object Wrapper Classes, System, Runtime, String ,StringBuffer, String Builder, String Tokenazir",@"IO   : Input Stream, Output Stream, File Reading and Writing, Serialization, Externalization",@"UTIL   :Collection Framework - List   : ArrayList, LinkedList, Vector, Stack.   Set:   TreeSet, HashSet, LinkedHashSet.   Queue   : PriorityQue, Deque.  Map   : HashMap, LinkedHashMap, TreeMap, HashTable, Properties. Sorting Using Comparable and Comparator. Internalization (i18n) and Localization (i10n). ResourceBundle, Date, Time & TimeZone, Calender, Currency, Number, Formatter, Scanner", nil];
    
    Modules *module1Fourth = [Modules new];
    module1Fourth.name = @"New Features of Java";
    module1Fourth.imageFile = @"New Features of Java";
    module1Fourth.duration = @"7 Days";
    module1Fourth.contents = [NSArray arrayWithObjects:@"Annotations",@"Enumerations",@"Generics",@"Varargs",@"Static Import",@"AutoBoxing",@"Enahanced for loop", nil];
    
    Modules *module1Fipth = [Modules new];
    module1Fipth.name = @"Database & SQL (Oracle & MySql)";
    module1Fipth.imageFile = @"Database & SQL (Oracle & MySql)";
    module1Fipth.duration = @"20 Days";
    module1Fipth.contents = [NSArray arrayWithObjects:@"Introduction to Oracle & MySql, Database architecture, Instance & Schema Normalization and Denormalization",@"Queies - DDL, DML, DCL, TCL",@"Constraints - Primary Key, ForiegnKey, NOTNULL, Unique, Check",@"SQL JOINS - Inner Join, Left Outer Join, Right Outer Join, Full Join, Self Join",@"SQL Functions - Conversion, String, Mathematical & Aggregate Function. Structure of SQL Using GroupBy, OrderBy. Sequence, View, Index, Synonym", nil];
    
    Modules *module1Sixth = [Modules new];
    module1Sixth.name = @"Free Content for Module 1 :";
    module1Sixth.imageFile = @"Free Content";
    module1Sixth.duration = @"5 Days";
    module1Sixth.contents = [NSArray arrayWithObjects:@"Aptitude and Soft skills training for clearing interviews and AMCAT & eLitnus examples", nil];
    
    Modules *module2First = [Modules new];
    module2First.name = @"1.  JDBC";
    module2First.imageFile = @"JDBC";
    module2First.duration = @"10 Days";
    module2First.contents = [NSArray arrayWithObjects:@"Types of Drivers",@"Connection",@"Statement",@"PreparedStatement",@"CallableStatement",@"ResultSet",@"Transaction",@"Oracle PL/SQL(stored Procedure)", nil];
    
    Modules *module2Second = [Modules new];
    module2Second.name = @"2.  Servlet";
    module2Second.imageFile = @"Servlet";
    module2Second.duration = @"10 Days";
    module2Second.contents = [NSArray arrayWithObjects:@"Introduction to Web Applications",@"JEE Architecture and Server Architecture (Web Server & Application Server)",@"Introduction to Servlet",@" Life Cycle of Servlet",@"Servlet API",@"ServletConfig",@"ServletContext",@"HTTP Session",@"Session Management",@"Scopes in Servlet",@"Filter",@"Lisner and RequestDispatcher.", nil];
   
    Modules *module2Third = [Modules new];
    module2Third.name = @"3.  JSP";
    module2Third.imageFile = @"JSP";
    module2Third.duration = @"10 Days";
    module2Third.contents = [NSArray arrayWithObjects:@"Introduction to JSP",@"Lifecycle of JSP",@"Imlicit Objects of JSP",@"Scripting Elements",@"Directives",@"Standerd Actions",@"Custom Tags",@"JSTL",@"EL", nil];
    
    Modules *module2Fourth = [Modules new];
    module2Fourth.name = @"MVC Architecture";
    module2Fourth.imageFile = @"MVC";
    module2Fourth.duration = @"3 Days";
    module2Fourth.contents = [NSArray arrayWithObjects:@"Free Contents with Module 2",@"Projects : 3 Free Live Projects",@"Web Design  : HTML, CSS, JavaScript , Jquery, Ajax",@"Software Development Methodology : SDLC :-Waterfall and Agile",@"Build and Development Tool : Maven, ANT, Log4J, Eclips, Apex, Junit",@"Design Patterns : Front Controller Design Pattern, DAO Factory, Singleton", nil];
    
    
    
    Modules *module3First = [Modules new];
    module3First.name = @"1.  Hibernate";
    module3First.imageFile = @"Hibernate";
    module3First.duration = @"10 Days";
    module3First.contents = [NSArray arrayWithObjects:@"Introduction to Hibernate Architecture",@"Session Factory",@"Mapping with XML & Annotations",@"Persistance Object Life Cycle",@"Entity relationship",@"ORM-Mappings (Basic Mapping:-121, 12M, M21, M2M Unidirection & Bidirection)",@"Caching",@"Transaction Management",@"Queries - HQL, QBC, QBE", nil];
    
    Modules *module3Second = [Modules new];
    module3Second.name = @"2.  Spring";
    module3Second.imageFile = @"Spring";
    module3Second.duration = @"10 Days";
    module3Second.contents = [NSArray arrayWithObjects:@"Introduction to Spring",@"Dependency Injection with Compnant Scanning",@"AOP",@"Bean LifeCycle in Beanfactory & ApplicationContext container",@"Spring MVC",@"Spring Transactions",@"Integrations", nil];
    
    Modules *module3Third = [Modules new];
    module3Third.name = @"1.  JSF";
    module3Third.imageFile = @"JSF";
    module3Third.duration = @"10 Days";
    module3Third.contents = [NSArray arrayWithObjects:@"Introduction to JSF",@"Basic Flow & Architecture of JSF",@"Life Cycle Phases of JSF",@"Facelets",@"JSF Componant Tree",@"Internalization (i18n)",@"Validation",@"Convertors",@"Rich Faces",@"Prime Faces",@"Ice faces",@"JSF with AJAX", nil];
    
    
    Modules *module4First = [Modules new];
    module4First.name = @"1.  EJB";
    module4First.imageFile = @"EJB";
    module4First.duration = @"7 Days";
    module4First.contents = [NSArray arrayWithObjects:@"Session Bean(Stateless, Statefull)",@"MDB",@"JPA",@"LifeCycle",@"AOP",@"Dependency Injection",@"Timer",@"Transactions",@"Integrations - JDBC, JPA, JNDI, JMS", nil];
    
    Modules *module4Second = [Modules new];
    module4Second.name = @"2.  WebService";
    module4Second.imageFile = @"WebService";
    module4Second.duration = @"5 Days";
    module4Second.contents = [NSArray arrayWithObjects:@"Axis",@"SOAP",@"JAX-RS(REST)", nil];
    
    
    
    
    self.Contents1 = [NSArray arrayWithObjects:module1First,module1Second,module1Third,module1Fourth,module1Fipth,module1Sixth,module2First,module2Second,module2Third,module2Fourth,module3First,module3Second,module3Third,module4First,module4Second, nil];
    
    self.Contents2 = [NSArray arrayWithObjects:module2First,module2Second,module2Third,module2Fourth, nil];
    
    self.Contents3 = [NSArray arrayWithObjects:module3First,module3Second,module3Third, nil];
    
    self.Contents4 = [NSArray arrayWithObjects:module4First,module4Second, nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return self.Contents1.count;
    }
    else if (section == 1) {
        return self.Contents2.count;
    }
    else if (section == 3) {
        return self.Contents3.count;
    }
    else{
        
        return self.Contents4.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    
    if ([indexPath section] == 0) {
        
        Modules *module1 = [self.Contents1 objectAtIndex:indexPath.row];
        cell.labelField.text = module1.name;
       
    }
    
    else  if ([indexPath section] == 1) {
        Modules *module2 = [self.Contents2 objectAtIndex:indexPath.row];
        cell.labelField.text = module2.name;
        
    }
    
    else  if ([indexPath section] == 2) {
        Modules *module3 = [self.Contents3 objectAtIndex:indexPath.row];
        cell.labelField.text = module3.name;
        
    }
    else{
        
        Modules *module4 = [self.Contents4 objectAtIndex:indexPath.row];
        cell.labelField.text = module4.name;
    }
    

    
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return @"Core & Advanced Java (OCJP/SCJP Syllabus) and Database";
    }
    
    else if (section == 1) {
        return @"JEE - JDBC, SERVLET, JSP & MVC Architecture (OCPJWCD/SCWCD Syllabus)";
    }
    
    else if (section == 2) {
        return @"ADVANCED JAVA FRAMEWORKS (JSF, Spring, Hibernate))";
    }
    else{
        return @"EJB & WEBSERVICES (OCPJBCD/SCBCD Syllabus)";
        
    }
    
}


;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    [self performSegueWithIdentifier:@"contentDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"contentDetail"]) {
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        
        ContentViewController *contentController = segue.destinationViewController;
        
        
        
        if ([indexPath section] == 0) {
            
           
            
            contentController.moduleObject = [self.Contents1 objectAtIndex:indexPath.row];
           
            
        }
        
        else  if ([indexPath section] == 1) {
            
            contentController.moduleObject = [self.Contents2 objectAtIndex:indexPath.row];
            
        }
        
        else  if ([indexPath section] == 2) {
            
           contentController.moduleObject = [self.Contents3 objectAtIndex:indexPath.row];
            
        }
        else{
            
            contentController.moduleObject = [self.Contents4 objectAtIndex:indexPath.row];
        }

    }

    //        // Hide bottom tab bar in the detail view
    //        //   destViewController.hidesBottomBarWhenPushed = YES;
    //    }
    //}

}
@end
