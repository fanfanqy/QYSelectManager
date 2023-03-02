//
//  QYSelectManager.m
//  QYSelectManager
//
//  Created by 范庆宇 on 2021/12/22.
//  Copyright © 2021 Transfar. All rights reserved.
//

#import "QYSelectManager.h"

@implementation QYSelectManager

- (BOOL)isNullSourceDataArray{
    return !self.sourceDataArray || self.sourceDataArray.count == 0;
}

//接口返回的model 转换为SelectModel
- (NSArray *)modelConversionSelectModel:(NSArray<QYSelectModelProtocol> *)modelArray isSelected:(BOOL)isSelected
{
    if (!modelArray || modelArray.count == 0) {
        return @[];
    }
    NSMutableArray *selectModelArray = [NSMutableArray array];
    for (int i = 0; i<modelArray.count; i++) {
        QYSelectModel *model = [QYSelectModel new];
        model.model = modelArray[i];
        if ([modelArray[i] respondsToSelector:@selector(qy_selectId)]) {
            model.selectId = [modelArray[i] qy_selectId];
            
        }
        model.isSelected = isSelected;
        [selectModelArray addObject:model];
    }
    return [NSArray arrayWithArray:selectModelArray];
}

//获取已选数组
- (NSArray <QYSelectModel<QYSelectModelProtocol> *>*)obtainSelectedData
{
    if ([self isNullSourceDataArray]) {
        return nil;
    }
    NSMutableArray *selectedData = [[NSMutableArray alloc] init];
    [self.sourceDataArray enumerateObjectsUsingBlock:^(QYSelectModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelected) {
            [selectedData addObject:obj];
        }
    }];
    return [NSArray arrayWithArray:selectedData];
}

//获取已选数据的ID
- (NSArray <NSString *>*)obtainSelectedID{
    if ([self isNullSourceDataArray]) {
        return nil;
    }
    NSMutableArray *selectedIDArray = [[NSMutableArray alloc] init];
    for (QYSelectModel *obj in self.sourceDataArray) {
        if (obj.isSelected) {
            if (obj.selectId) {
                [selectedIDArray addObject:obj.selectId];
                
            }
        }
    }
    return [NSArray arrayWithArray:selectedIDArray];
}

//刷新数据
- (void)reloadData:(void(^)(BOOL isAllSelected,  NSInteger selectedNum))block{
    NSArray *selectedArray = [self obtainSelectedData];
    BOOL isAllselected = NO;
    NSInteger selectedNum = 0;
    if (selectedArray){
        isAllselected = (selectedArray.count == self.sourceDataArray.count);
        selectedNum = selectedArray.count;
    }
    if (block) {
        block(isAllselected,selectedNum);
    }
}

//全选数据
- (void)allSelectedData{
    if ([self isNullSourceDataArray]) {
        return;
    }
    for (QYSelectModel *obj in self.sourceDataArray) {
        obj.isSelected = YES;
    }
}

//取消全选
- (void)cancelAllSelectedData{
    if ([self isNullSourceDataArray]) {
        return;
    }
    for (QYSelectModel *obj in self.sourceDataArray) {
        obj.isSelected = NO;
    }
}

//选中一个数据
- (void)selectedOneData:(QYSelectModel *)model{
    if (!self.isMoreSelect) {
        [self cancelAllSelectedData];
    }
    model.isSelected = YES;
}

- (BOOL)selectedOneDataWithSelectId:(NSString *)selectId
{
    BOOL select = NO;
    if (!self.isMoreSelect) {
        [self cancelAllSelectedData];
    }
    for (QYSelectModel *obj in self.sourceDataArray) {
        if ([obj.selectId isEqualToString:selectId]) {
            obj.isSelected = YES;
            select = YES;
            break;
        }
    }
    return select;
}

- (void)selectedListDataWithSelectId:(NSArray *)selectIds{
    if (!selectIds || selectIds.count == 0) {
        return;
    }
    for (QYSelectModel *obj in self.sourceDataArray) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@",obj.selectId];
        NSArray *results = [selectIds filteredArrayUsingPredicate:predicate];
        if (results && results.count > 0) {
            obj.isSelected = YES;
        }
    }
}

//取消选中一个数据
- (void)cancelSelectedOneData:(QYSelectModel *)model{
    model.isSelected = NO;
}

//新增源数据
- (void)appendSourceData:(NSArray *)dataArray{
    if ([self isNullSourceDataArray]) {
        self.sourceDataArray = [NSMutableArray arrayWithArray:dataArray];
        return;
    }
    [self.sourceDataArray addObjectsFromArray:dataArray];
}

//清空源数据
- (void)clearSourceData{
    [self.sourceDataArray removeAllObjects];
}

@end
