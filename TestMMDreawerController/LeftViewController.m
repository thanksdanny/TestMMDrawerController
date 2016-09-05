//
//  LeftViewController.m
//  TestMMDreawerController
//
//  Created by Danny Ho on 9/5/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "LeftViewController.h"
#import "Header.h"
#import "TestViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = [Header headerLoad];
    self.tableView.scrollEnabled = NO;
}


#pragma mark - data source

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"thanksdanny";
    
    return cell;
}

#pragma mark - 选中跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestViewController *testVC = [TestViewController new];
    
    [self.navigationController pushViewController:testVC animated:YES];
}




@end
