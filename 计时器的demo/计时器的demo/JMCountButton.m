//
//  JMCountButton.m
//  计时器的demo
//
//  Created by caijiamu on 16/6/23.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import "JMCountButton.h"

@interface JMCountButton ()
/**
 *  时间
 */
@property (nonatomic, assign) NSInteger time;
/**
 *  定时器
 */
@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation JMCountButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = YES;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}

-(void)setStartCount:(BOOL)startCount
{
    _startCount = startCount;
    if (_startCount) {
        _time = 60;
        self.userInteractionEnabled = NO;
        [self setTitle:[NSString stringWithFormat:@"%ld",(long)_time] forState:UIControlStateNormal];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeTime)];
        self.displayLink.frameInterval = 60.0;
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }else{
        [self.displayLink invalidate];
        self.displayLink = nil;
        self.userInteractionEnabled = YES;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;

    }
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
-(void)changeTime
{
    if (_time != 0) {
        _time--;
        [self setTitle:[NSString stringWithFormat:@"%lds",(long)_time] forState:UIControlStateNormal];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
    }else{
        [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        [self.displayLink invalidate];
        self.displayLink = nil;
        self.userInteractionEnabled = YES;
        [self setTitle:[NSString stringWithFormat:@"获取验证码"] forState:UIControlStateNormal];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(void)setDisplayLink:(CADisplayLink *)displayLink
{
    [_displayLink invalidate];
    _displayLink = displayLink;
}
@end
