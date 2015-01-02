//
//  GameScene.h
//  GreenRedBlackGame
//

//  Copyright (c) 2014 Avery Lamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
#import "RWGameData.h"
@interface GameScene : SKScene
@property CGSize screenSize;
@property BOOL lost;
@property BOOL active;
@property GameViewController *viewController;
-(void)lose:(NSString *)loseMessage;
@end
