//
//  AddFeedbackViewController.m
//  GZDoctor
//
//  Created by khj on 2020/8/2.
//  Copyright © 2020 张浩. All rights reserved.
//


#import "AddFeedbackViewController.h"
#import "AddFeedbackModel.h"
#import "ChildFeedbackModel.h"
#import "AddFeedbackTableViewCell.h"

static const CGFloat AddFeedbackBottomH = 60;

@interface AddFeedbackViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) NSMutableArray *totalArray;
@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, retain) NSArray<AddFeedbackModel *> *dataArray;

@property (nonatomic, retain) NSIndexPath *indexPath;

@property (nonatomic, retain) UIView *bottomView;
@end

@implementation AddFeedbackViewController


- (NSMutableArray *)totalArray{
    if (!_totalArray) {
        _totalArray = [NSMutableArray array];
    }
    return _totalArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TableView单选";
    
    NSArray *array = @[
        @{@"title" : @"您的睡眠情况如何？",
          @"content" :@[
                  @{@"answer" : @"明显改善，一觉睡到天亮",},
                  @{@"answer" : @"入睡容易，起夜较少",},
                  @{@"answer" : @"总是睡不醒，起来后感觉很累"}]
        },
        @{ @"title" : @"您的出汗情况如何？",
           @"content" : @[
                   @{@"answer" : @"后背出汗明显增多"},
                   @{@"answer" : @"夜晚睡觉出汗较多"},
                   @{@"answer" : @"出汗不明显"}],
        },
        @{@"title" : @"您身上出现疱疹的情况？",
          @"content" : @[
                  @{@"answer" : @"腿部出现少量疱疹"},
                  @{@"answer" : @"背部有疱疹出现"},
                  @{@"answer" : @"没有疱疹出现"}]
        },
        @{@"title" : @"你吃多少饭？",
          @"content" : @[
                  @{@"answer" : @"5碗"},
                  @{@"answer" : @"2碗"},
                  @{@"answer" : @"3碗"}]
        },
        @{@"title" : @"你喝多少升水",
          @"content" : @[
                  @{@"answer" : @"5升"},
                  @{@"answer" : @"2升"},
                  @{@"answer" : @"3升"}]
        },
        @{@"title" : @"官方？",
          @"content" : @[
                  @{@"answer" : @"1官方"},
                  @{@"answer" : @"2官方"},
                  @{@"answer" : @"3官方"}]
        },
        @{@"title" : @"中国",
          @"content" : @[
                  @{@"answer" : @"5中国"},
                  @{@"answer" : @"2中国"},
                  @{@"answer" : @"3中国"}]
        }
        
        
    ];
    self.dataArray = [AddFeedbackModel mj_objectArrayWithKeyValuesArray:array];
    
    
    self.view.backgroundColor = UIColorFromRGB(0xF2F4F8);
    [self.view addSubview:self.tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:(UIBarButtonItemStylePlain) target:self action:@selector(didClickRightButton)];
    
}


- (void)didClickRightButton{
    [self.totalArray removeAllObjects];
    for (NSInteger i = 0; i< self.dataArray.count; i++) {
        [self.dataArray[i].content enumerateObjectsUsingBlock:^(ChildFeedbackModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect == YES) {
                [self.totalArray addObject:obj.answer];
            }
        }];
    }
    NSLog(@"%@",[self.totalArray mj_JSONString]);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArray[section].isExpand) {
        return [self.dataArray[section].content count];;
    }else{
        return 0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    UIControl *backView = [[UIControl alloc] initWithFrame:CGRectMake(15, 0, SCREENWIDTH - 30, 50)];
    UIImageView *turnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50, 21, 12, 7)];
    turnImageView.image = [[UIImage imageNamed:@"fb_bottom"] imageWithRenderingMode:1];
    [backView addSubview:turnImageView];
    
    backView.tag = 1000 + section;
    headView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREENWIDTH - 60, 50)];
    [backView addSubview:titlelabel];
    titlelabel.font = kFont(15);
    titlelabel.text = [NSString stringWithFormat:@"%ld、%@",section + 1,self.dataArray[section].title];
    titlelabel.numberOfLines = 0;
    if (self.dataArray[section].isExpand) {
        turnImageView.image = [[UIImage imageNamed:@"fb_top"] imageWithRenderingMode:1];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:backView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = backView.bounds;
        maskLayer.path = maskPath.CGPath;
        backView.layer.mask = maskLayer;
    }else{
        turnImageView.image = [[UIImage imageNamed:@"fb_bottom"] imageWithRenderingMode:1];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:backView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(6, 6)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = backView.bounds;
        maskLayer.path = maskPath.CGPath;
        backView.layer.mask = maskLayer;
        
        
    }
    
    [headView addSubview:backView];
    
    [backView addTarget:self action:@selector(didClickedSection:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return headView;
}
- (void)didClickedSection:(UIControl *)view{
    NSInteger i = view.tag - 1000;
    self.dataArray[i].isExpand = !self.dataArray[i].isExpand;
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:i];
    [_tableView reloadSections:index withRowAnimation:(UITableViewRowAnimationAutomatic)];
    /** 如果需要收起上一个分区 就用下面的代码 */
    //    [self.dataArray enumerateObjectsUsingBlock:^(AddFeedbackModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        if ([obj.title isEqualToString:self.dataArray[i].title]) {
    //            obj.isExpand = !obj.isExpand;
    //        }
    //        else{
    //            obj.isExpand = NO;
    //        }
    //    }];
        //刷新列表
    //    [_tableView reloadData];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    if (indexPath.row == 0) {
    AddFeedbackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.indexPath.section == indexPath.section) {
        if (self.indexPath == indexPath) {
            self.dataArray[indexPath.section].content[indexPath.row].isSelect = YES;
            
        }else{
            self.dataArray[indexPath.section].content[indexPath.row].isSelect = NO;
            
        }
    }
    cell.childModel = self.dataArray[indexPath.section].content[indexPath.row];
    
    return cell;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = YES;
        //        _tableView.bounces = NO;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
        }
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AddFeedbackTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [tableView reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

/** 设置分区圆角 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if ([cell isKindOfClass:[LZRowTableViewCell class]]) {
    
    // 圆角弧度半径
    CGFloat cornerRadius = 6.f;
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    cell.backgroundColor = UIColor.clearColor;
    
    // 创建一个shapeLayer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 获取cell的size
    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    CGRect bounds = CGRectInset(cell.bounds, 15, 0);
    
    // CGRectGetMinY：返回对象顶点坐标
    // CGRectGetMaxY：返回对象底点坐标
    // CGRectGetMinX：返回对象左边缘坐标
    // CGRectGetMaxX：返回对象右边缘坐标
    // CGRectGetMidX: 返回对象中心点的X坐标
    // CGRectGetMidY: 返回对象中心点的Y坐标
    
    // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
    
    // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
    //        if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
    //            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    //            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
    //            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
    //            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
    //            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMidY(bounds), cornerRadius);
    //            CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    //        }
    //        else if (indexPath.row == 0) {
    //            // 初始起点为cell的左下角坐标
    //            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    //            // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
    //            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
    //            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
    //            // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
    //            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    //
    //        }
    
    if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    } else {
        // 添加cell的rectangle信息到path中（不包括圆角）
        CGPathAddRect(pathRef, nil, bounds);
    }
    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CFRelease(pathRef);
    // 按照shape layer的path填充颜色，类似于渲染render
    // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    cell.backgroundView = roundView;
    
    // 以上方法存在缺陷当点击cell时还是出现cell方形效果，因此还需要添加以下方法
    // 如果你 cell 已经取消选中状态的话,那以下方法是不需要的.
    //    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:bounds];
    //    backgroundLayer.fillColor = [UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1].CGColor;
    //    [selectedBackgroundView.layer insertSublayer:backgroundLayer atIndex:0];
    //    selectedBackgroundView.backgroundColor = UIColor.clearColor;
    //    cell.selectedBackgroundView = selectedBackgroundView;
    //    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
