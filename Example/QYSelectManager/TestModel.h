//
//  TestModel.h
//  QYSelectManager_Example
//
//  Created by 范庆宇 on 2023/3/2.
//  Copyright © 2023 范庆宇_24961. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYSelectModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject<QYSelectModelProtocol>

@property(nonatomic,strong)NSString *ID;

@end

NS_ASSUME_NONNULL_END
