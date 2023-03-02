//
//  QYViewController.m
//  QYSelectManager
//
//  Created by 范庆宇_24961 on 11/11/2022.
//  Copyright (c) 2022 范庆宇_24961. All rights reserved.
//

#import "QYViewController.h"
#import "QYSelectManager.h"
#import "TestModel.h"
@interface QYViewController ()

@property (nonatomic, strong) QYSelectManager *selectMethod;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = [self.selectMethod modelConversionSelectModel:[self testArray] isSelected:NO];
    
    [self.selectMethod appendSourceData:array];
    
    NSLog(@"sourceDataArray：%@",self.selectMethod.sourceDataArray);
    
    [self.selectMethod selectedOneDataWithSelectId:@"2"];
    
    NSLog(@"selectedID：%@",self.selectMethod.obtainSelectedID);
    
}

- (NSArray *)testArray
{
    NSMutableArray *testArray = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        TestModel *model = [TestModel new];
        model.ID = [NSString stringWithFormat:@"%d",i];
        [testArray addObject:model];
        
    }
    return testArray;
    
}

- (QYSelectManager *)selectMethod
{
    if (!_selectMethod) {
        _selectMethod = [QYSelectManager new];
//        _selectMethod.isMoreSelect = YES;
        
    }
    return _selectMethod;
}

@end
