//
//  AFChatTableViewContrioller.m
//  SimpleMessenger
//
//  Created by Александр on 03.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "AFChatTableViewContrioller.h"
#import "UIRefreshControl+AFNetworking.h"
#import "AFPostTableViewCell.h"
#import "Post.h"

@interface AFChatTableViewContrioller () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *posts;

@end

@implementation AFChatTableViewContrioller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 100.0f)];
    [self.refreshControl addTarget:self action:@selector(reloadPosts) forControlEvents:UIControlEventValueChanged];
    [self reloadPosts];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)reloadPosts {
    NSURLSessionTask *task = [Post getPostsGlobalStream:^(NSArray *posts, NSError *error) {
        if (!error) {
            self.posts = posts;
            [self.tableView reloadData];
        }
    }];
    
    [self.refreshControl setRefreshingWithStateOfTask:task];
}

#pragma mark - UITableViewDataSource

static NSString *cellIdentifier = @"Cell";

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    AFPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[AFPostTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.post = self.posts[(NSUInteger)indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

@end
