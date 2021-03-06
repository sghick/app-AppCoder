//
//  ACRAppDataBase.h
//  AppCoder
//
//  Created by 丁治文 on 2018/11/2.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACRTempleteMeta;
@class ACRAppInfo;
@interface ACRAppDataBase : NSObject

#pragma mark - ACRTempleteMeta

+ (void)insertOrReplaceMetas:(NSArray<ACRTempleteMeta *> *)metas;
+ (NSArray<ACRTempleteMeta *> *)selectRootMetas;
+ (NSArray<ACRTempleteMeta *> *)selectNotRootWildMetas;
+ (NSArray<ACRTempleteMeta *> *)selectNotRootNormalMetas;
+ (NSArray<ACRTempleteMeta *> *)selectMetasWithSuperIdentifier:(NSString *)superIdentifier;
+ (ACRTempleteMeta *)selectMetaWithIdentifier:(NSString *)identifier;
+ (BOOL)updateMetaWithIdentifier:(ACRTempleteMeta *)meta;
+ (BOOL)deleteMetaWithIdentifier:(NSString *)identifier;
+ (BOOL)deleteRootMetas;
+ (BOOL)deleteMetasWithSuperIdentifier:(NSString *)superIdentifier;

+ (BOOL)deleteAllMetas;

#pragma mark - ACRAppInfo

+ (void)insertOrReplaceAppInfos:(NSArray<ACRAppInfo *> *)appInfos;
+ (NSArray<ACRAppInfo *> *)selectRootAppInfos;
+ (NSArray<ACRAppInfo *> *)selectAppInfosWithSuperIdentifier:(NSString *)superIdentifier;
+ (BOOL)updateAppInfoWithIdentifier:(ACRAppInfo *)appInfo;
+ (BOOL)deleteAppInfoWithIdentifier:(NSString *)identifier;
+ (BOOL)deleteRootAppInfos;
+ (BOOL)deleteAppInfosWithSuperIdentifier:(NSString *)superIdentifier;

+ (BOOL)deleteAllAppInfos;

@end
