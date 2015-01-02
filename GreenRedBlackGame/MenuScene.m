//
//  MenuScene.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 1/1/15.
//  Copyright (c) 2015 Avery Lamp. All rights reserved.
//

#import "MenuScene.h"

@interface  MenuScene()
@property CGSize screenSize;
@end
@implementation MenuScene

-(void)didMoveToView:(SKView *)view
{
    if ([self.view isKindOfClass:[SKView class]]) {
        NSLog(@"IT IS A SKVIEW");
    }else{
        NSLog(@"IT IS A UIVIEW");
    }
    SKView * skView = (SKView *)self.view;
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    //self.screenSize = CGSizeMake(screenBounds.size.width, screenBounds.size.height);
    self.screenSize= screenSize;
    NSLog(@"Screen Size - %f , %f",self.screenSize.width,self.screenSize.height);
    SKLabelNode *titleLabel = [[SKLabelNode alloc]initWithFontNamed:@"Party LET"];
    //UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.screenSize.width, self.screenSize.height/3.5)];
    titleLabel.text = @"Tap Attack!";
    //titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.fontColor = [UIColor blackColor];
    titleLabel.fontSize = 125.0f;
    titleLabel.position = CGPointMake(self.screenSize.width/2,self.screenSize.height - self.screenSize.height/7);
    //titleLabel.font = [UIFont fontWithName:@"Party LET" size:50.0f];
    [self addChild:titleLabel];
    
    SKSpriteNode * playButton = [[SKSpriteNode alloc]initWithImageNamed:@"playButton"];
    playButton.position = CGPointMake(self.screenSize.width / 2, self.screenSize.height/3);
    playButton.xScale = 2.5;
    playButton.yScale = 2.5;
    playButton.name = @"playButton";
    [self addChild:playButton];
    NSLog(@"HERE");
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"playButton"]){
        [self.viewController play:nil];
    }
    
    
}

@end
