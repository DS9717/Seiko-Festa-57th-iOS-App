//
//  InfoViewController.h
//  Seiko Festa 57th
//
//  Created by Daisuke  on 2016/04/05.
//  Copyright (c) 2016年 Daisuke Masuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
    IBOutlet UITableView *_tableView;
    
    int cellNumber;
}

@property (nonatomic) int _cellNumber;

@end
