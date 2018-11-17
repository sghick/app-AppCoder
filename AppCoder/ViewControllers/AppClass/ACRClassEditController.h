//
//  ACRClassEditController.h
//  AppCoder
//
//  Created by 丁治文 on 2018/10/31.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 App类编辑页
 */
@class ACRAppInfo;
@class ACRAppPage;
@interface ACRClassEditController : UIViewController

@property (strong, nonatomic) ACRAppInfo *appInfo;
@property (strong, nonatomic) ACRAppPage *appPage;

@end