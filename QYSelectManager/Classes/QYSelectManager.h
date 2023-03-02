//
//  QYSelectManager.h
//  TransfarShipper
//
//  Created by 范庆宇 on 2021/12/22.
//  Copyright © 2021 Transfar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYSelectModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QYSelectManager : NSObject

@property (nonatomic,assign)BOOL isMoreSelect;//是否为多选 默认NO单选
@property (nonatomic,strong)NSMutableArray <QYSelectModel *>*sourceDataArray;//数据源

//接口返回的model 转换为SelectModel
- (NSArray *)modelConversionSelectModel:(NSArray<QYSelectModelProtocol> *)modelArray isSelected:(BOOL)isSelected;

//获取已选数组
- (NSArray <QYSelectModel<QYSelectModelProtocol> *>*)obtainSelectedData;

//获取已选数据的ID
- (NSArray <NSString *>*)obtainSelectedID;

//刷新数据
- (void)reloadData:(void(^)(BOOL isAllSelected, NSInteger selectedNum))block;

//全选数据
- (void)allSelectedData;

//取消全选
- (void)cancelAllSelectedData;

//选中一个数据
- (void)selectedOneData:(QYSelectModel *)model;

- (BOOL)selectedOneDataWithSelectId:(NSString *)selectId;

- (void)selectedListDataWithSelectId:(NSArray *)selectIds;

//取消选中一个数据
- (void)cancelSelectedOneData:(QYSelectModel *)model;

//新增源数据
- (void)appendSourceData:(NSArray *)dataArray;

//清空源数据
- (void)clearSourceData;

@end

NS_ASSUME_NONNULL_END

