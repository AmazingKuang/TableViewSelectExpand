//
//  AddFeedbackModel.m
//  GZDoctor
//
//  Created by khj on 2020/8/2.
//  Copyright © 2020 张浩. All rights reserved.
//

#import "AddFeedbackModel.h"

@implementation AddFeedbackModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"content" : [ChildFeedbackModel class]};
}

MJCodingImplementation

@end
