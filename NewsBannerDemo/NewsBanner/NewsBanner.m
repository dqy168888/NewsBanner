//
//  NewNoticeView.m
//  NewsBannerDemo
//
//  Created by sunhao－iOS on 16/4/28.
//  Copyright © 2016年 ssyzh. All rights reserved.
//

#import "NewsBanner.h"
#import "Masonry.h"

@implementation NewsBanner

static int countInt=0;

- (NSArray *)noticeList{
    
    if (!_noticeList) {
        _noticeList = [NSArray array];
    }
    return _noticeList;
}

- (NSArray *)awardList{
    
    if (!_awardList) {
        _awardList = [NSArray array];
    }
    return _awardList;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initContentView];
    }
    
    return self;
}

- (void)initContentView{
    self.clipsToBounds = YES;
    self.notice = [UILabel new];
    self.notice.font = [UIFont systemFontOfSize:15.0];
    self.notice.textColor = [UIColor lightGrayColor];
    self.notice.userInteractionEnabled = YES;
    [self addSubview:self.notice];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.notice addGestureRecognizer:tap];
    
    
}

- (void)layoutSubviews{
    
    [self.notice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

}

-(void)displayNews{
    countInt++;
 
    if (countInt >= [self.noticeList count])
        countInt=0;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self.notice.layer addAnimation:animation forKey:@"animationID"];
    self.notice.text = self.noticeList[countInt];

}
- (void)tap:(UITapGestureRecognizer *)tap
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(NewsBanner:didSelectIndex:)]) {
        
        [_delegate NewsBanner:self didSelectIndex:countInt];
        
    }

}
- (void)star
{
    [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
}
@end
