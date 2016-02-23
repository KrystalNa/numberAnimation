//
//  ViewController.m
//  06-数字滚动
//
//  Created by Doris on 16/2/21.
//  Copyright © 2016年 Doris. All rights reserved.
//

#import "ViewController.h"
#import "LNNumberScrollAnimatedView.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVAudioPlayerDelegate>
@property (nonatomic ,strong) LNNumberScrollAnimatedView *socreTensDigitAnimation;
@property (nonatomic ,strong) LNNumberScrollAnimatedView *socreDigitAnimation;
@property (nonatomic ,strong) LNNumberScrollAnimatedView *socreAnimation;
@property (nonatomic, strong) NSMutableArray *playerArr;
@property (nonatomic, strong) AVAudioPlayer *numberPlayer;
@end

@implementation ViewController
- (NSMutableArray *)playerArr
{
    if (_playerArr == nil) {
        _playerArr = [[NSMutableArray alloc] init];
    }
    return _playerArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    UIFont *textFont = [UIFont systemFontOfSize:40];
    CGSize textSize = [@"9" sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName, nil]];

    //个位十位单独设置,可分别设定各自速度
    LNNumberScrollAnimatedView *socreTensDigitAnimation = [[LNNumberScrollAnimatedView alloc] initWithFrame:CGRectMake(100, 100, textSize.width, textSize.height)];
    socreTensDigitAnimation.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:socreTensDigitAnimation];
    socreTensDigitAnimation.textColor = [UIColor redColor];
    socreTensDigitAnimation.font = textFont;
    socreTensDigitAnimation.density = 7;
    socreTensDigitAnimation.duration = 1.9;
    socreTensDigitAnimation.minLength = 1;
    [socreTensDigitAnimation setValue:@9];
    [socreTensDigitAnimation sizeToFit];
    socreTensDigitAnimation.isAscending = YES;
    socreTensDigitAnimation.durationOffset = 0.1;
    self.socreTensDigitAnimation = socreTensDigitAnimation;
    
    LNNumberScrollAnimatedView *socreDigitAnimation = [[LNNumberScrollAnimatedView alloc] initWithFrame:CGRectMake(100+textSize.width, 100, textSize.width, textSize.height)];
    socreDigitAnimation.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:socreDigitAnimation];
    socreDigitAnimation.textColor = [UIColor redColor];
    socreDigitAnimation.font = textFont;
    [socreDigitAnimation setValue:@9];
    [socreDigitAnimation sizeToFit];
    socreDigitAnimation.density = 21;
    socreDigitAnimation.duration = 1.95;
    socreDigitAnimation.minLength = 1;
    socreDigitAnimation.isAscending = YES;
    socreDigitAnimation.durationOffset = 0.1;
    self.socreDigitAnimation = socreDigitAnimation;
    
    
    //个位十位统一设置,速度一样,可设置结束时间间隔差
    CGSize scoreTextSize = [@"19" sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName, nil]];
    LNNumberScrollAnimatedView *socreAnimation = [[LNNumberScrollAnimatedView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(socreDigitAnimation.frame)+textSize.width, 100, scoreTextSize.width*1.1, scoreTextSize.height)];
    socreAnimation.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:socreAnimation];
    socreAnimation.textColor = [UIColor blueColor];
    socreAnimation.font = textFont;
    [socreAnimation setValue:@19];
    [socreAnimation sizeToFit];
    socreAnimation.density = 21;
    socreAnimation.duration = 1.95;
    socreAnimation.minLength = 2;
    socreAnimation.isAscending = NO;
    socreAnimation.durationOffset = 0.1;
    self.socreAnimation = socreAnimation;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (int i = 0; i<19; i++) {
        [self performSelector:@selector(playSound) withObject:nil afterDelay:0.1];
    }
    
    [self.socreTensDigitAnimation setValue:[NSNumber numberWithInt:1]];
    [self.socreTensDigitAnimation startAnimation];
    [self.socreDigitAnimation setValue:[NSNumber numberWithInt:9]];
    [self.socreDigitAnimation startAnimation];
    [self.socreAnimation startAnimation];
}

#pragma mark - 播放音效
- (void)playSound
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"number.wav" withExtension:nil];
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url)
                                     , &soundID);
    AudioServicesPlayAlertSound (soundID);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
