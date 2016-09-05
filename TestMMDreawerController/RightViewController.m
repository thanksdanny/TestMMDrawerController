//
//  RightViewController.m
//  TestMMDreawerController
//
//  Created by Danny Ho on 9/5/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "RightViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <Masonry.h>
#import "TestViewController.h"


@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewWillAppear:(BOOL)animated {
    // 加载界面是隐藏导航控制器
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    // 界面即将消失时显示导航控制器
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self customView];
}

- (void)customView {
    // 自定义center控制器的导航控制器的view
    UIView *viewBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    
    // 设置nav bar的背景图片
    viewBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"anniu"]];
    
    // 左侧按钮
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 35, 24, 24)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u73"] forState:UIControlStateNormal];
    
    // 设置圆角
    [leftButton setBackgroundColor:[UIColor whiteColor]];
    leftButton.layer.cornerRadius = 12;
    leftButton.layer.masksToBounds = YES;
    
    // 添加事件
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [viewBar addSubview:leftButton];
    
    // 右侧按钮
    UIButton *rightButton = [[UIButton alloc] init];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"u73"] forState:UIControlStateNormal];
    
    // 设置圆角
    [rightButton setBackgroundColor:[UIColor whiteColor]];
    rightButton.layer.cornerRadius = 12;
    rightButton.layer.masksToBounds = YES;
    [rightButton addTarget:self action:@selector(rightItemClick) forControlEvents:UIControlEventTouchUpInside];
    
    [viewBar addSubview:rightButton];
    
    // 右按钮约束
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBar).with.offset(30);
        make.right.equalTo(viewBar).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    // 添加首页title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"test";
    titleLabel.font = [UIFont systemFontOfSize:18];
    [viewBar addSubview:titleLabel];
    
    // 标题约束
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBar).with.offset(22);
        make.centerX.equalTo(viewBar);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    [self.view addSubview:viewBar];
    
}


#pragma mark - 点击收回/打开MMDrawerSide
- (void)back {
    // 判断是否打开Side
    if (!self.mm_drawerController.openSide) {
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
            NSLog(@"打开");
        }];
    }
    // 关闭
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        NSLog(@"关闭");
    }];
}

#pragma mark - 右侧点击事件

- (void)rightItemClick {
    // 创建子控制器
    TestViewController *testVC = [TestViewController new];
    
    // 跳转
    [self.navigationController pushViewController:testVC animated:YES];
}
@end
