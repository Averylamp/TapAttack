//
//  GameScene.h
//  GreenRedBlackGame
//

//  Copyright (c) 2014 Avery Lamp. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
@interface GameScene : SKScene
@property CGSize screenSize;
@property GameViewController *viewController;
-(void)lose;
@end
