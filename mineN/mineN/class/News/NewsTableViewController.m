//
//  NewsTableViewController.m
//  mineN
//
//  Created by 王亚征 on 15/11/6.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"
@interface NewsTableViewController ()
@property(nonatomic,strong)NSArray *newslist;
@end

@implementation NewsTableViewController
-(void)setNewslist:(NSArray *)newslist{
    _newslist = newslist;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    [News loadNewslistUrlstring:@"T1348647853363/0-20.html"finished:^(NSArray *newslist) {
        NSLog(@"%@",newslist);
//        设置数值
        weakself.newslist = newslist;

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newslist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    cell.news = self.newslist[indexPath.row];
    
    return cell;
}




@end
