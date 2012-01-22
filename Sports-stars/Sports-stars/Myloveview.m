//
//  Myloveview.m
//  Sports-stars
//
//  Created by johnbass on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Myloveview.h"

@implementation Myloveview

@synthesize liSTData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



#pragma mark - 按下add觸發事件
- (IBAction)add_touch:(id)sender {
    NSLog(@"chack");
   
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"test1",@"test2",@"test3", nil];
    self.liSTData = array;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.liSTData count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    struct NSString * TableIdentifier1 = @"tableidentifier";
    UITableViewCell *cell1 = [[UITableViewCell alloc] init];


    
    UIImage *image =[UIImage imageNamed:@"second.png"];
    cell1.imageView.image = image;
    
    NSInteger row = [indexPath row];
    
    cell1.detailTextLabel.text = @"this is detail text"; 
    
    cell1.textLabel.text = [liSTData objectAtIndex:row];
    cell1.textLabel.font = [UIFont boldSystemFontOfSize:15]; 
    return cell1;
    
    
}



- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
