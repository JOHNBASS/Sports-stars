//
//  Myloveview.h
//  Sports-stars
//
//  Created by johnbass on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Myloveview : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *liSTData;
    
}
@property(nonatomic,retain)NSArray *liSTData;

@end
