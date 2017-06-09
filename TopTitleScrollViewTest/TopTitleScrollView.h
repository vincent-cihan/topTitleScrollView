//
//  TopTitleScrollView.h
//  GreenLand
//
//  Created by 刘乙灏 on 2017/6/9.
//  Copyright © 2017年 chy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TopTitleScrollViewAddClickBlock)(void);
typedef void(^TopTitleScrollViewSelectBtnClickBlock)(NSInteger index);

@interface TopTitleScrollView : UIView

/**
 *  一行多少个，如不设置默认5
 */
@property (nonatomic, assign) NSInteger lineNum;
/**
 *  标题未选择颜色，默认黑色
 */
@property (nonatomic, strong) UIColor *titleNormalColor;
/**
 *  标题选中颜色，默认绿色
 */
@property (nonatomic, strong) UIColor *titleSelectedColor;
/**
 *  标题字体大小，默认15
 */
@property (nonatomic, assign) NSInteger titleFont;

@property (nonatomic, copy) NSMutableArray *dataArray;

@property (nonatomic, copy) TopTitleScrollViewAddClickBlock TopTitleScrollViewAddClickBlock;
@property (nonatomic, copy) TopTitleScrollViewSelectBtnClickBlock TopTitleScrollViewSelectBtnClickBlock;

/**
 *  手动改变点击btn(联动)
 */
- (void)selectBtnAtIndex:(NSInteger)index;

@end
