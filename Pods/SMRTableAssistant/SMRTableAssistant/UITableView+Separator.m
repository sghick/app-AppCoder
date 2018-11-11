//
//  UITableView+Separator.m
//  SeperatorLine
//
//  Created by 丁治文 on 16/7/11.
//  Copyright © 2016年 丁治文. All rights reserved.
//

#import "UITableView+Separator.h"
#import <objc/runtime.h>

@interface UITableView ()

@property (nonatomic, assign) BOOL didMarkedCustom;

@end

@implementation UITableView (Separator)

#pragma mark - Getters/Setters
// didMarkedCustom
static const char SMRDidMarkedCustomKey = '\0';
- (void)setDidMarkedCustom:(BOOL)didMarkedCustom {
    if (didMarkedCustom != self.didMarkedCustom) {
        objc_setAssociatedObject(self, &SMRDidMarkedCustomKey, @(didMarkedCustom), OBJC_ASSOCIATION_RETAIN);
    }
}

- (BOOL)didMarkedCustom {
    NSNumber *number = objc_getAssociatedObject(self, &SMRDidMarkedCustomKey);
    return number.boolValue;
}

// leftMargin
static const char SMRLeftMarginKey = '\0';
- (void)setLeftMargin:(CGFloat)leftMargin {
    if (leftMargin != self.leftMargin) {
        objc_setAssociatedObject(self, &SMRLeftMarginKey, @(leftMargin), OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGFloat)leftMargin {
    NSNumber *number = objc_getAssociatedObject(self, &SMRLeftMarginKey);
    return number?number.doubleValue:10;
}

// rightMargin
static const char SPRightMarginKey = '\0';
- (void)setRightMargin:(CGFloat)rightMargin {
    if (rightMargin != self.rightMargin) {
        objc_setAssociatedObject(self, &SPRightMarginKey, @(rightMargin), OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGFloat)rightMargin {
    NSNumber *number = objc_getAssociatedObject(self, &SPRightMarginKey);
    return number?number.doubleValue:10;
}

#pragma mark - Utils
// 推荐在初始化方法中添加,如Getter方法中
- (void)smr_markCustomTableViewSeparators {
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    self.separatorColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
    // 设置隐藏系统额外的线
    [self smr_setExtraCellLineHidden];
    self.didMarkedCustom = YES;
}

- (void)smr_setSeparatorsWithFormat:(NSString *)format cell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    if (self.didMarkedCustom == NO) {
        self.didMarkedCustom = YES;
        [self smr_markCustomTableViewSeparators];
        NSAssert(NO, @"%s:未标记使用自定义样式线, 请使用 '-:smr_markCustomTableViewSeparators'", __func__);
    }
    
    
}

// private 隐藏多余的view
- (void)smr_setExtraCellLineHidden {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

// private
- (void)setCell:(UITableViewCell *)cell separatorMargins:(UIEdgeInsets)inset {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:inset];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

// private
- (UIEdgeInsets)insetForLeftShort {
    return UIEdgeInsetsMake(0, self.leftMargin, 0, 0);
}

// private
- (UIEdgeInsets)insetForAllShort {
    return UIEdgeInsetsMake(0, self.leftMargin, 0, self.rightMargin);
}

// private
- (UIEdgeInsets)insetForLone {
    return UIEdgeInsetsZero;
}

// private
- (UIEdgeInsets)insetForNone {
    return UIEdgeInsetsMake(0, [UIScreen mainScreen].bounds.size.width, 0, 0);
}

@end