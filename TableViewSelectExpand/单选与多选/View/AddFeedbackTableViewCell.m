//
//  AddFeedbackTableViewCell.m
//  GZDoctor
//
//  Created by khj on 2020/8/2.
//  Copyright © 2020 张浩. All rights reserved.
//

#import "AddFeedbackTableViewCell.h"

@interface AddFeedbackTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *selectImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end



@implementation AddFeedbackTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChildModel:(ChildFeedbackModel *)childModel{
    _childModel = childModel;
    if (_childModel.isSelect) {
            self.selectImageView.image = [UIImage  imageNamed:@"feedback_select"];

    }else{
        self.selectImageView.image = [UIImage  imageNamed:@"feedback_noSelect"];

    }
    self.titleLabel.text = _childModel.answer;

}

@end
