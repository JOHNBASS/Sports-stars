//
//  Top10view.m
//  Sports-stars
//
//  Created by johnbass on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Top10view.h"

@implementation Top10view

@synthesize listData;

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"top10");
    
    //NSArray *array = [[NSArray alloc] initWithObjects:@"row1",@"row2",@"row3",@"row4",@"row5",nil]; 
    
    
    
    
    NSMutableArray *array_plist=[[NSMutableArray alloc]init];
    
    [array_plist  addObject:@"test1"];
    [array_plist  addObject:@"test2"];
    [array_plist  addObject:@"test3"];
    [array_plist  addObject:@"test4"];  
    [array_plist  addObject:@"test5"]; 
    
    
    self.listData = array_plist;
    
}


#pragma mark- 回傳有幾筆資料在arrary
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ 
    return [self.listData count]; //回傳有幾筆資料要呈現 
}




#pragma mark- 規劃list 每行的物件
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
    
    //在繪製每一列時會呼叫的方法
    static NSString *TableIdentifier = @"tableidentifier"; //設定一個就算離開畫面也還是抓得到的辨識目標 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier]; 
    //呼叫以下方法以避免當已經沒有表格要呈現的時候 
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableIdentifier] ; 
    } 
    //放入每列前圖片 
    UIImage *image = [UIImage imageNamed:@"first.png"]; 
    cell.imageView.image = image; 
    //用 row 變數去得知現在繪製的是哪一列 
    NSUInteger row = [indexPath row]; 
    cell.textLabel.text = [listData objectAtIndex:row]; 
    //更改字體大小 
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15]; 
    //判斷表格內容並顯示說明文字 
    if (row == 0) { 
        cell.detailTextLabel.text = @"this is detail text"; 
    } 
    
    
    return cell; 
}

#pragma mark- 

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
