//
//  youtube_api_view.m
//  Sports-stars
//
//  Created by johnbass on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "youtube_api_view.h"

@implementation youtube_api_view


-(void)youtube_api_Json
{
    //youtube api 網址.
    NSString *urlString = [NSString stringWithFormat:@"https://gdata.youtube.com/feeds/api/videos?alt=json&q=%@&orderby=title&start-index=1&max-results=10&v=2",@"運動"];
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
        
    
    for ( in [title objectForKey:@"$t"]) {
        <#statements#>
    }
    
    //    for (NSString * date in aArray_date) {
    //        NSLog(@"dates : %@",date);
    //    }
    
    NSString * name = [title objectForKey:@"$t"];
    /////////////////////////////////////////////////////////////////////////
    
    NSArray *link =[[entry objectAtIndex:0] objectForKey:@"link"];
    NSString *href = [[link objectAtIndex:0] objectForKey:@"href"];
    
    
    NSLog(@"name: %@ href:%@",name,href);
    //[[UIApplication sharedApplication]openURL:[NSURL URLWithString:href]];
    
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
