//
//  GameViewController.h
//  GreenRedBlackGame
//

//  Copyright (c) 2014 Avery Lamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface GameViewController : UIViewController
@property   CGSize screenSize;
@property int lastScore;
-(void)menu:(UIButton *)sender;
-(void)play:(UIButton *)sender;
-(void)loseScene:(UIButton *)sender;

-(void)reportScore: (int) scoreInpt;
-(void)updateAchievements;
@end
