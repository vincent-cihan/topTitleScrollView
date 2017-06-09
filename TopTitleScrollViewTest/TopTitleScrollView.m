//
//  TopTitleScrollView.m
//  GreenLand
//
//  Created by 刘乙灏 on 2017/6/9.
//  Copyright © 2017年 chy. All rights reserved.
//

#import "TopTitleScrollView.h"
#import "Masonry.h"

@interface TopTitleScrollView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TopTitleScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _lineNum = 5;
        _titleNormalColor = [UIColor blackColor];
        _titleSelectedColor = [UIColor greenColor];
        _titleFont = 15;
    }
    return self;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = [dataArray copy];
    CGFloat width = [UIScreen mainScreen].bounds.size.width / _lineNum;
    for (NSInteger i = 0; i < dataArray.count; i++) {
        NSString *title = dataArray[i];
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:_titleSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag=100+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.scrollView).offset(0);
            make.height.equalTo(self.scrollView);
            make.left.equalTo(self.scrollView).offset(width * i);
            make.width.mas_equalTo(width);
            if (i == dataArray.count - 1) {
                make.right.equalTo(self.scrollView).offset(0);
            }
        }];
        
        if (i == 0) {
            btn.selected = YES;
        }
    }
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.width.equalTo(addBtn.mas_height);
        make.right.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-44);
    }];
}

- (void)selectBtnAtIndex:(NSInteger)index {
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *otherBtn = (UIButton *)view;
            otherBtn.selected = NO;
        }
    }
    UIButton *btn = [self viewWithTag:index + 100];
    btn.selected = YES;
    [self.scrollView setContentOffset:CGPointMake((self.scrollView.contentSize.width - self.scrollView.frame.size.width + btn.frame.size.width) / self.dataArray.count * (btn.tag - 100), 0) animated:YES];
    if (_TopTitleScrollViewSelectBtnClickBlock) {
        _TopTitleScrollViewSelectBtnClickBlock(btn.tag - 100);
    }
}

- (void)btnClick:(UIButton *)btn {
    [self selectBtnAtIndex:btn.tag - 100];
}

- (void)addBtnClick:(UIButton *)btn {
    if (_TopTitleScrollViewAddClickBlock) {
        _TopTitleScrollViewAddClickBlock();
    }
}

@end
