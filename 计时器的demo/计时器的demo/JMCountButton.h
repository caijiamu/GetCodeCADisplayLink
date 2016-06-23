//
//  JMCountButton.h
//  计时器的demo
//
//  Created by caijiamu on 16/6/23.
//  Copyright © 2016年 cloud.wood-group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMCountButton : UIButton
/**
 *  是否启动计时器
 */
@property (nonatomic, assign,getter=isStartCount) BOOL startCount;
@end
