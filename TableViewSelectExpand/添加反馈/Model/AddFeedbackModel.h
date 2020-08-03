//
//  AddFeedbackModel.h
//  GZDoctor
//
//  Created by khj on 2020/8/2.
//  Copyright © 2020 张浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChildFeedbackModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddFeedbackModel : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *name;

/** 内容 */
@property (nonatomic, copy) NSArray<ChildFeedbackModel *> *content;

/** 是否展开 */
@property (nonatomic, assign) BOOL isExpand;

/** 已反馈 */
@property (nonatomic, copy) NSString *giveFeedback;

@end

NS_ASSUME_NONNULL_END
