//
//  ACRAppDataBase.m
//  AppCoder
//
//  Created by 丁治文 on 2018/11/2.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "ACRAppDataBase.h"
#import "SMRDB.h"
#import "ACRAppModels.h"

@implementation ACRAppDataBase

#pragma mark - ACRTempleteMeta

+ (void)insertOrReplaceMetas:(NSArray<ACRTempleteMeta *> *)metas {
    [ACRTempleteMeta insertOrReplace:metas];
}
+ (NSArray<ACRTempleteMeta *> *)selectRootMetas {
    NSString *where = @"WHERE is_root=1";
    return [ACRTempleteMeta selectWhere:where];
}
+ (NSArray<ACRTempleteMeta *> *)selectNotRootWildMetas {
    NSString *where = @"WHERE is_root<>1 AND super_identifier is null";
    return [ACRTempleteMeta selectWhere:where];
}
+ (NSArray<ACRTempleteMeta *> *)selectNotRootNormalMetas {
    NSString *where = @"WHERE is_root<>1 AND super_identifier is not null";
    return [ACRTempleteMeta selectWhere:where];
}
+ (NSArray<ACRTempleteMeta *> *)selectMetasWithSuperIdentifier:(NSString *)superIdentifier {
    if (!superIdentifier) {
        return nil;
    }
    NSString *where = @"WHERE super_identifier=(?)";
    return [ACRTempleteMeta selectWhere:where paramsArray:@[superIdentifier]];
}
+ (ACRTempleteMeta *)selectMetaWithIdentifier:(NSString *)identifier {
    if (!identifier) {
        return nil;
    }
    NSString *where = @"WHERE identifier=(?)";
    return [ACRTempleteMeta selectFirstObjectWhere:where paramsArray:@[identifier]];
}
+ (BOOL)updateMetaWithIdentifier:(ACRTempleteMeta *)meta {
    if (!meta || !meta.identifier) {
        return NO;
    }
    NSString *where = [NSString stringWithFormat:@"WHERE identifier='%@'", meta.identifier];
    return [ACRTempleteMeta update:meta where:where];
}
+ (BOOL)deleteMetaWithIdentifier:(NSString *)identifier {
    if (!identifier) {
        return nil;
    }
    NSString *where = @"WHERE identifier=(?)";
    return [ACRTempleteMeta deleteWhere:where paramsArray:@[identifier]];
}
+ (BOOL)deleteRootMetas {
    NSString *where = @"WHERE is_root=1";
    return [ACRTempleteMeta deleteWhere:where];
}
+ (BOOL)deleteMetasWithSuperIdentifier:(NSString *)superIdentifier {
    if (!superIdentifier) {
        return nil;
    }
    NSString *where = @"WHERE super_identifier=(?)";
    return [ACRTempleteMeta deleteWhere:where paramsArray:@[superIdentifier]];
}

+ (BOOL)deleteAllMetas {
    return [ACRTempleteMeta deleteAll];
}

#pragma mark - ACRAppInfo

+ (void)insertOrReplaceAppInfos:(NSArray<ACRAppInfo *> *)appInfos {
    [ACRAppInfo insertOrReplace:appInfos];
}
+ (NSArray<ACRAppInfo *> *)selectRootAppInfos {
    NSString *where = @"WHERE is_root=1";
    return [ACRAppInfo selectWhere:where];
}
+ (NSArray<ACRAppInfo *> *)selectAppInfosWithSuperIdentifier:(NSString *)superIdentifier {
    if (!superIdentifier) {
        return nil;
    }
    NSString *where = @"WHERE super_identifier=(?)";
    return [ACRAppInfo selectWhere:where paramsArray:@[superIdentifier]];
}
+ (BOOL)updateAppInfoWithIdentifier:(ACRAppInfo *)appInfo {
    if (!appInfo || !appInfo.identifier) {
        return NO;
    }
    NSString *where = [NSString stringWithFormat:@"WHERE identifier=%@", appInfo.identifier];
    return [ACRAppInfo update:appInfo where:where];
}
+ (BOOL)deleteAppInfoWithIdentifier:(NSString *)identifier {
    if (!identifier) {
        return nil;
    }
    NSString *where = @"WHERE identifier=(?)";
    return [ACRAppInfo deleteWhere:where paramsArray:@[identifier]];
}
+ (BOOL)deleteRootAppInfos {
    NSString *where = @"WHERE is_root=1";
    return [ACRAppInfo deleteWhere:where];
}
+ (BOOL)deleteAppInfosWithSuperIdentifier:(NSString *)superIdentifier {
    if (!superIdentifier) {
        return nil;
    }
    NSString *where = @"WHERE super_identifier=(?)";
    return [ACRAppInfo deleteWhere:where paramsArray:@[superIdentifier]];
}


+ (BOOL)deleteAllAppInfos {
    return [ACRAppInfo deleteAll];
}

@end
