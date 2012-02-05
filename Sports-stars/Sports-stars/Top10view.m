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
-(void)youtube_api_Json
{
    //youtube api 網址.
    NSString *urlString = [NSString stringWithFormat:@"https://gdata.youtube.com/feeds/api/videos?alt=json&q=%@+比賽&orderby=title&start-index=1&max-results=10&v=2",@"王建民"];
    //對中文轉換為nsutf8
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *jsonStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSDictionary *result = [jsonStr JSONValue];  //解析成json 放入陣列
    
    NSDictionary *feed = [result objectForKey:@"feed"];
    
    NSArray *entry = [feed objectForKey:@"entry"];
    
    
    ///////////////////////////////////////////////////////////////////////// 
    
    
    
    //    NSDictionary *title =[[entry objectAtIndex:0]objectForKey:@"title"];//名字
    //    NSString * name = [title objectForKey:@"$t"];
    
    NSDictionary *title =[[entry objectAtIndex:0]objectForKey:@"title"];//名字
    
    NSDictionary *updataedTime =[[entry objectAtIndex:0]objectForKey:@"updated"];//更新時間
    
    NSDictionary *media_group =[[entry objectAtIndex:0]objectForKey:@"media$group"];//抓取圖片
    
    NSArray *media_thumbnail = [media_group objectForKey:@"media$thumbnail"];
    
    NSDictionary *url_image =[[media_thumbnail objectAtIndex:0]objectForKey:@"url"];//抓取圖片
    
    NSLog(@"updataedTime: %@",updataedTime);
    
    
   video_title  = [[NSMutableArray alloc] init];
    video_url =[[NSMutableArray alloc] init];
    video_logo =[[NSMutableArray alloc] init];
    video_update =[[NSMutableArray alloc] init];
    
    for ( int i = 0 ; i < 10; i++) {
    NSDictionary* title1 = [[entry objectAtIndex:i]objectForKey:@"title"];
        NSString * name1 = [title1 objectForKey:@"$t"];
        [video_title addObject:name1];
        
        NSArray *link1 = [[entry objectAtIndex:i] objectForKey:@"link"];
        NSString *href1 = [[link1 objectAtIndex:0] objectForKey:@"href"];
        [video_url addObject:href1];
        
        NSDictionary *media_group1 = [[entry objectAtIndex:i]objectForKey:@"media$group"];//抓取圖片
        NSArray *media_thumbnail1 = [media_group1 objectForKey:@"media$thumbnail"];
        NSDictionary *url_image1 = [[media_thumbnail1 objectAtIndex:0]objectForKey:@"url"];//抓取圖片
        [video_logo addObject:url_image1];
        
            NSDictionary *updataedTime1 = [[entry objectAtIndex:i]objectForKey:@"updated"];//更新時間
            NSString * updatadate1 = [updataedTime1 objectForKey:@"$t"];
        [video_update addObject:updatadate1];
        
    }
    
//    for (NSString * data in video_url) {
//        NSLog(@"data : %@",data);
//    }
    
    
    NSString * name = [title objectForKey:@"$t"];
    NSString * updatadate = [updataedTime objectForKey:@"$t"];
    /////////////////////////////////////////////////////////////////////////
    
    NSArray *link =[[entry objectAtIndex:0] objectForKey:@"link"];
    NSString *href = [[link objectAtIndex:0] objectForKey:@"href"];
    
    
//    NSLog(@"name: %@ href:%@  image:%@ ",name,href,image);
    
//    for ( int i = 0 ; i < 10; i++) {
//        NSArray *link1 =[[entry objectAtIndex:i] objectForKey:@"link"];
//        NSString *href1 = [[link1 objectAtIndex:i] objectForKey:@"href"];
//        [video_url addObject:href1];
//        
//        
//    }
    
    //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:href]];
    
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"top10");
    
    //NSArray *array = [[NSArray alloc] initWithObjects:@"row1",@"row2",@"row3",@"row4",@"row5",nil]; 
    
    
    
    [self youtube_api_Json];
    
    NSMutableArray *array_plist=[[NSMutableArray alloc]init];
   //倒入title _name到plist 
        for (NSString * data in video_title) {
            [array_plist addObject:data];
        }
    

    
    
    self.listData = array_plist;
    

    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark- 回傳有幾筆資料在arrary
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ 
    return [self.listData count]; //回傳有幾筆資料要呈現 
}


//調整每列的高度 , 如果要客製化, 只要用 if (row==0) 判斷即可 
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ 
    return 200; 
}

#pragma mark- 規劃list 每行的物件
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //用 row 變數去得知現在繪製的是哪一列 
    NSUInteger row = indexPath.row; 
    
    //在繪製每一列時會呼叫的方法
    static NSString *TableIdentifier = @"tableidentifier"; //設定一個就算離開畫面也還是抓得到的辨識目標 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier]; 
    //呼叫以下方法以避免當已經沒有表格要呈現的時候 
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier] ; 
        
    } 

    int section_index = indexPath.section;
    
    
    if (0 == section_index) {
         
        UILabel *NameLabel = [[UILabel alloc] init];
        NameLabel.frame = CGRectMake(20, 0, 300, 100);
        NameLabel.text = [NSString stringWithFormat:@"%@",[video_title objectAtIndex:row]];
        NameLabel.textColor = [UIColor blackColor];
        NameLabel.backgroundColor = [UIColor clearColor];
        NameLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10)];
        [cell addSubview:NameLabel];
        
        NSLog(@"%d",row);
        
        CGRect webFrame = CGRectMake(30, 100, 120, 90);
        UIWebView *webView = [[UIWebView alloc] initWithFrame:webFrame];
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[video_logo objectAtIndex:row]]]];
        [cell addSubview:webView];

    }
    
    
      //放入每列前圖片 
//    UIImage *image = [UIImage imageNamed:@"first.png"]; 
//    cell.imageView.image = image; 
    

    
//    cell.textLabel.text = [listData objectAtIndex:row]; 
//    cell.textLabel.frame = CGRectMake(0, 0, 10, 10);
//    //更改字體大小 
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:15]; 
//    cell.detailTextLabel.text = [video_update objectAtIndex:row]; 
    
    //判斷表格內容並顯示說明文字 
//    for (int i = 0; i <= 10; i++) {
//        
//        if (row == i) {
            
        
    

//        }
//    }
    return cell; 
}

#pragma mark- 點下的觸發事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{ 
    NSUInteger row = [indexPath row]; 
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[video_url objectAtIndex:row]]];
    
//    NSString *rowValue = [listData objectAtIndex:row]; //用 NSString 去記錄使用者點選的 row 
//    NSString *message = [[NSString alloc] initWithFormat:@"you pressed row %@",rowValue]; 
//    //用一個 alert 去告訴使用者現在正在點選的 Row 
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ROW SELECTED" message:message delegate:nil cancelButtonTitle:@"I GOT IT" otherButtonTitles:nil]; 
//    [alert show]; 

    //讓選取的效果消失 
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; 
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
