//
//  Top10view.h
//  Sports-stars
//
//  Created by johnbass on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "youtube_api_view.h"
#import "SBJson.h"

@interface Top10view : UIViewController<UITableViewDelegate , UITableViewDataSource>
{
   NSArray *listData;   
   NSMutableArray *video_title;
   NSMutableArray *video_url; 
}
@property (nonatomic,retain) NSArray *listData;

@end
