//
//  TFCSelectModel.h
//  TransfarShipper
//
//  Created by lxx on 2021/12/22.
//  Copyright © 2021 Transfar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYSelectModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface QYSelectModel : NSObject

@property (nonatomic, strong)id<QYSelectModelProtocol> model;//数据
@property (nonatomic, strong)NSString *selectId;//一般用ID、number 标识
@property (nonatomic, assign)BOOL isSelected; //是否选中

@end

NS_ASSUME_NONNULL_END
