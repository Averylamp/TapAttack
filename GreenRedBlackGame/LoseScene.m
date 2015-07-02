//
//  LoseScene.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 1/1/15.
//  Copyright (c) 2015 Avery Lamp. All rights reserved.
//

#import "LoseScene.h"
#import <QuartzCore/QuartzCore.h>
#import <GameKit/GameKit.h>


@interface  LoseScene()
@property CGSize screenSize;
@property CGSize screenBounds;
@property SKLabelNode *scoreLabel;
@property SKSpriteNode *scoreBackground;
@property SKLabelNode *shareLabel;
@property SKSpriteNode *shareBackground;
@property SKLabelNode *homeLabel;
@property SKSpriteNode *homeBackground;
@property SKLabelNode *againLabel;
@property SKSpriteNode *againBackground;

@property UIView *shareView;
@property UIView *blocker;
@property BOOL allowTouches;
@end
@implementation LoseScene

-(void)didMoveToView:(SKView *)view
{
    self.allowTouches = YES;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.screenBounds = screenBounds.size;
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    self.screenSize= screenSize;
    SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    scoreLabel.text = @"GAME OVER!";
    scoreLabel.fontSize = 150.0f* screenScale / 2;
    scoreLabel.fontColor = [UIColor blackColor];
    scoreLabel.position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 160* screenScale / 2);
    [self addChild:scoreLabel];
    
    SKSpriteNode *backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    CGPoint position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 280* screenScale / 2);
    backgroundButton.xScale = 2.3 * screenScale / 2;
    backgroundButton.yScale = 1.8 * screenScale / 2;
    backgroundButton.position = position;
    scoreLabel.text = [NSString stringWithFormat:@"SCORE : %d",self.viewController.lastScore];
    scoreLabel.fontSize = 80.0f* screenScale / 2;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 310* screenScale / 2);
    scoreLabel.position = position;
    backgroundButton.name = @"score";
    scoreLabel.name = @"score";
    self.scoreLabel=scoreLabel;
    self.scoreBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 420* screenScale / 2);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2.3* screenScale / 2;
    backgroundButton.yScale = 1.8* screenScale / 2;
    backgroundButton.position= position;
    scoreLabel.text = @"GAME CENTER";
    scoreLabel.fontSize = 80.0f* screenScale / 2;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 450* screenScale / 2);
    scoreLabel.position= position;
    backgroundButton.name = @"Game Center";
    scoreLabel.name = @"Game Center";
    self.shareLabel = scoreLabel;
    self.shareBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 560* screenScale / 2);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2.3* screenScale / 2;
    backgroundButton.yScale = 1.8* screenScale / 2;
    backgroundButton.position= position;
    scoreLabel.text = @"BACK HOME";
    scoreLabel.fontSize = 80.0f* screenScale / 2;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 590* screenScale / 2);
    scoreLabel.position= position;
    backgroundButton.name = @"home";
    scoreLabel.name = @"home";
    self.homeLabel = scoreLabel;
    self.homeBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height - 700* screenScale / 2);
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    backgroundButton = [[SKSpriteNode alloc]initWithImageNamed:@"loseScreenButtonBackground"];
    backgroundButton.xScale = 2.3* screenScale / 2;
    backgroundButton.yScale = 1.8* screenScale / 2;
    backgroundButton.position= position;
    scoreLabel.text = @"TRY AGAIN";
    scoreLabel.fontSize = 80.0f* screenScale / 2;
    position = CGPointMake(self.screenSize.width/2, self.screenSize.height- 730* screenScale / 2);
    scoreLabel.position= position;
    backgroundButton.name = @"again";
    scoreLabel.name = @"again";
    self.againLabel = scoreLabel;
    self.againBackground = backgroundButton;
    [self addChild:backgroundButton];
    [self  addChild:scoreLabel];
    
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    scoreLabel.text = @"HIGH SCORE";
    scoreLabel.fontColor = SKColor.blackColor;
    scoreLabel.fontSize = 70.0f* screenScale / 2;
    scoreLabel.position = CGPointMake(self.screenSize.width/2, self.screenSize.height-820* screenScale / 2);
    [self addChild:scoreLabel];
    
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"DIN Condensed"];
    scoreLabel.text = [NSString stringWithFormat: @"%d",  [RWGameData sharedGameData].highScore];
    scoreLabel.fontColor = SKColor.blackColor;
    scoreLabel.fontSize = 90.0f* screenScale / 2;
    scoreLabel.position = CGPointMake(self.screenSize.width/2, self.screenSize.height-890* screenScale / 2);
    [self addChild:scoreLabel];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!self.allowTouches){
        return;
    }
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKAction *growb = [SKAction scaleXTo:2.7* screenScale / 2 y:2* screenScale / 2 duration:0.15];
    SKAction *growl = [SKAction scaleTo:1.2 duration:0.15];
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
    }if([node.name isEqualToString:@"Game Center"]){
        [self.shareBackground runAction:growb];
        [self.shareLabel runAction:growl];
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!self.allowTouches){
        return;
    }
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKAction *shrinkb = [SKAction scaleXTo:2.3* screenScale / 2 y:1.8* screenScale / 2 duration:0.2];
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
    }if(![node.name isEqualToString:@"Game Center"]){
        [self.shareBackground runAction:shrinkb];
        [self.shareBackground runAction:shrinkl];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!self.allowTouches){
        return;
    }
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKAction *shrinkb = [SKAction scaleXTo:2.3 * screenScale / 2 y:1.8* screenScale / 2 duration:0.2];
    SKAction *shrinkl = [SKAction scaleTo:1 duration:0.2];
    if([node.name isEqualToString:@"share"]){
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.screenBounds.width/8,self.screenBounds.height/4, self.screenBounds.width*3/4, self.screenBounds.height/2)];
        self.shareView = view;
        view.backgroundColor = [UIColor colorWithRed:128.0f green:128.0f blue:128.0f alpha:1.0f];
        view.layer.cornerRadius = 7;
        view.layer.masksToBounds = YES;
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 4.0f;
        
        UIButton *facebookLink = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width / 3, view.frame.size.width / 3)];
        [facebookLink setBackgroundImage:[UIImage imageNamed:@"facebook_icon"] forState:UIControlStateNormal];
        facebookLink.center = CGPointMake(view.frame.size.width / 4,view.frame.size.height/2);
        [facebookLink addTarget:self action:@selector(facebookClicked) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:facebookLink ];
        
        
        UIButton * exitShareView = [[UIButton alloc]initWithFrame:CGRectMake(view.frame.size.width - 40, 0, 40, 40)];
        [self.shareView addSubview:exitShareView];
        [exitShareView addTarget:self action:@selector(exitShare) forControlEvents:UIControlEventTouchUpInside];
        [exitShareView setBackgroundImage:[UIImage imageNamed:@"exitButton"] forState:UIControlStateNormal];
        
        self.allowTouches = NO;
        
        [self.view addSubview:view];
    }else{
        [self.shareBackground runAction:shrinkb];
        [self.shareLabel runAction:shrinkl];
    }
    if([node.name isEqualToString:@"Game Center"]){
        GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
        
        gcViewController.gameCenterDelegate = self.viewController;
        
        if (self.viewController.leaderboardIdentifier) {
            gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
            gcViewController.leaderboardIdentifier = self.viewController.leaderboardIdentifier;
        }
        else{
            gcViewController.viewState = GKGameCenterViewControllerStateAchievements;
        }
        
        [self.viewController presentViewController:gcViewController animated:YES completion:nil];
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

-(void)facebookClicked{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
    {
        self.mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        self.mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //Tell him with what social plattform to use it, e.g. facebook or twitter
//        [self.mySLComposerSheet setInitialText:[NSString stringWithFormat:@"I just scored big time in Tap Attack!"]]; //the message you want to post
        //[self.mySLComposerSheet addImage:yourimage]; //an image you could post
        //for more instance methodes, go here:https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Reference/SLComposeViewController_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40012205

        [self.viewController presentViewController:self.mySLComposerSheet animated:YES completion:nil];
    }
    [self.mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Post Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        } //check if everything worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
}
-(void)twitterClicked{
    
}

-(void)exitShare{
    [self.shareView removeFromSuperview];
    self.allowTouches = YES;
    
}

@end
