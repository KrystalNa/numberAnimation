//
//  JTNumberScrollAnimatedView.h
//  JTNumberScrollAnimatedView
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>

@interface LNNumberScrollAnimatedView : UIView

@property (strong, nonatomic) NSNumber *value;/**<最后显示的值*/
@property (strong, nonatomic) UIColor *textColor;/**<文本颜色*/
@property (strong, nonatomic) UIFont *font;/**<字体大小*/
@property (assign, nonatomic) CFTimeInterval duration;/**<动画持续时间*/
@property (assign, nonatomic) CFTimeInterval durationOffset;/**<不同位数字停止时间差*/
@property (assign, nonatomic) NSUInteger density;/**<duration内展示的数字个数*/
@property (assign, nonatomic) NSUInteger minLength;/**<最小展示位数,不足补零*/
@property (assign, nonatomic) BOOL isAscending;/**<是否向上滚动 Y-向上 N-向下*/

- (void)startAnimation;/**<开始执行动画*/
- (void)stopAnimation;/**<结束执行动画*/
- (void)startAnimationAfterDelay:(NSTimeInterval)delay;/**<延迟delay秒执行动画*/

@end
