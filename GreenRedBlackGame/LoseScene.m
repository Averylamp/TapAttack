//
//  LoseScene.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 1/1/15.
//  Copyright (c) 2015 Avery Lamp. All rights reserved.
//

#import "LoseScene.h"
@interface  LoseScene()
@property  CGSize screenSize;
@property SKLabelNode *scoreLabel;
@property SKSpriteNode *scoreBackground;
@property SKLabelNode *shareLabel;
@property SKSpriteNode *shareBackground;
@property SKLabelNode *homeLabel;
@property SKSpriteNode *homeBackground;
@property SKLabelNode *againLabel;
@property SKSpriteNode *againBackground;
@end
@implementation LoseScene

-(void)didMoveToView:(SKView *)view
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    self.screenSize= screenSize;
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    scoreLabel.text = @"GAME OVER!";
    scoreLabel.fontSize = 150.0f;
    scoreLabel.fontColor = [UIColor blackColor];
    scoreLabel.position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 160);
    [self addChild:scoreLabel];
    
    SKSpriteNode *backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    CGPoint position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 280);
    backgroundButton.name = @"score";
    scoreLabel.name = @"score";
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position = position;
    scoreLabel.text = [NSString stringWithFormat:@"SCORE:%d",self.viewController.lastScore];
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 310);
    scoreLabel.position = position;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 420);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton.name = @"share";
    scoreLabel.name = @"share";
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position= position;
    scoreLabel.text = @"SHARE";
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 450);
    scoreLabel.position= position;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 560);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton.name = @"home";
    scoreLabel.name = @"home";
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position= position;
    scoreLabel.text = @"BACK HOME";
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 590);
    scoreLabel.position= position;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 700);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton.name = @"again";
    scoreLabel.name = @"again";
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position= position;
    scoreLabel.text = @"TRY AGAIN";
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 730);
    scoreLabel.position= position;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
