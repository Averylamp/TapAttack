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
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position = position;
    scoreLabel.text = [NSString stringWithFormat:@"SCORE:%d",self.viewController.lastScore];
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 310);
    scoreLabel.position = position;
    backgroundButton.name = @"score";
    scoreLabel.name = @"score";
    self.scoreLabel=scoreLabel;
    self.scoreBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 420);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position= position;
    scoreLabel.text = @"SHARE";
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 450);
    scoreLabel.position= position;
    backgroundButton.name = @"share";
    scoreLabel.name = @"share";
    self.shareLabel = scoreLabel;
    self.shareBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 560);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position= position;
    scoreLabel.text = @"BACK HOME";
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 590);
    scoreLabel.position= position;
    backgroundButton.name = @"home";
    scoreLabel.name = @"home";
    self.homeLabel = scoreLabel;
    self.homeBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 700);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2;
    backgroundButton.yScale = 1.8;
    backgroundButton.position= position;
    scoreLabel.text = @"TRY AGAIN";
    scoreLabel.fontSize = 80.0f;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 730);
    scoreLabel.position= position;
    backgroundButton.name = @"again";
    scoreLabel.name = @"again";
    self.againLabel = scoreLabel;
    self.againBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKAction *growb = [SKAction scaleXTo:2.4 y:2 duration:0.2];
    SKAction *growl = [SKAction scaleTo:1.2 duration:0.2];
    if([node.name isEqualToString:@"share"]){
        [self.shareBackground runAction:growb];
        [self.shareLabel runAction:growl];
    }
    if([node.name isEqualToString:@"home"]){
        [self.homeBackground runAction:growb];
        [self.homeLabel runAction:growl];
    }
    if([node.name isEqualToString:@"again"]){
        [self.againBackground runAction:growb];
        [self.againLabel runAction:growl];
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKAction *shrinkb = [SKAction scaleXTo:2.0 y:1.8 duration:0.2];
    SKAction *shrinkl = [SKAction scaleTo:1 duration:0.2];
    if(![node.name isEqualToString:@"share"]){
        [self.shareBackground runAction:shrinkb];
        [self.shareLabel runAction:shrinkl];
    }
    if(![node.name isEqualToString:@"home"]){
        [self.homeBackground runAction:shrinkb ];
        [self.homeLabel runAction:shrinkl];
    }
    if(![node.name isEqualToString:@"again"]){
        [self.againBackground runAction:shrinkb];
        [self.againLabel runAction:shrinkl];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKAction *shrinkb = [SKAction scaleXTo:2.0 y:1.8 duration:0.2];
    SKAction *shrinkl = [SKAction scaleTo:1 duration:0.2];
    if([node.name isEqualToString:@"share"]){
        
    }else{
        [self.shareBackground runAction:shrinkb];
        [self.shareLabel runAction:shrinkl];
    }
    if([node.name isEqualToString:@"home"]){
        [self.viewController menu:nil];
    }else{

    }
    if([node.name isEqualToString:@"again"]){
        [self.viewController play:nil];
    }else{
        
    }
}

@end
