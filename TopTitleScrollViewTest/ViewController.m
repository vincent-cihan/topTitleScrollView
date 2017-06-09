//
//  ViewController.m
//  TopTitleScrollViewTest
//
//  Created by 刘乙灏 on 2017/6/9.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "ViewController.h"
#import "TopTitleScrollView.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) TopTitleScrollView *topScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.topScrollView];
    
    [self.topScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(60);
    }];
    
    self.topScrollView.dataArray = [NSMutableArray arrayWithArray:@[@"标题一",
                                                                    @"标题二",
                                                                    @"标题三",
                                                                    @"标题四",
                                                                    @"标题五",
                                                                    @"标题六",
                                                                    @"标题七",
                                                                    @"标题八",
                                                                    @"标题九",
                                                                    @"标题十",
                                                                    @"标题十一",
                                                                    @"标题十二"]];
}

- (TopTitleScrollView *)topScrollView {
    if (!_topScrollView) {
        _topScrollView = [[TopTitleScrollView alloc] init];
        _topScrollView.backgroundColor = [UIColor grayColor];
        _topScrollView.titleFont = 20;
        _topScrollView.titleNormalColor = [UIColor blackColor];
        _topScrollView.titleSelectedColor = [UIColor redColor];
        _topScrollView.lineNum = 4;
        _topScrollView.TopTitleScrollViewSelectBtnClickBlock = ^(NSInteger index) {
            NSLog(@"选中了第%ld个", index);
        };
        _topScrollView.TopTitleScrollViewAddClickBlock = ^{
            NSLog(@"点击了加号");
        };
    }
    return _topScrollView;
}


@end
