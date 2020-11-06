//
//  ChildFeedbackModel.h
//  GZDoctor
//
//  Created by khj on 2020/8/2.
//  Copyright © 2020 张浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChildFeedbackModel : NSObject


@property (nonatomic, copy) NSString *answer;

@property (nonatomic, assign) BOOL isSelect;


@end

NS_ASSUME_NONNULL_END
