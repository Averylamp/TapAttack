//
//  GameViewController.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 12/27/14.
//  Copyright (c) 2014 Avery Lamp. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "MenuScene.h"
#import "LoseScene.h"
#import <GameKit/GameKit.h>



@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@interface GameViewController()

@property BOOL gameCenterEnabled;
@property NSString *leaderboardIdentifier;



@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startGameCenter];
    [self menu:nil];
    //[self settupMenu];
    
}

/*
-(void)settupMenu{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    //CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    self.screenSize = CGSizeMake(screenBounds.size.width, screenBounds.size.height);
    NSLog(@"Screen Size - %f , %f",self.screenSize.width,self.screenSize.height);
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.screenSize.width, self.screenSize.height/3.5)];
    titleLabel.text = @"Tap Attack!";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont fontWithName:@"Party LET" size:50.0f];
    [self.view addSubview:titleLabel];
    UIButton *testbutton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    testbutton.backgroundColor = [UIColor blackColor];
    
    SKSpriteNode * playButton = [[SKSpriteNode alloc]initWithImageNamed:@"playButton"];
    playButton.position = CGPointMake(self.screenSize.width / 2, self.screenSize.height/3);
    //[self.view addSubview:testbutton];
 
    UIButton *playButton = [[UIButton alloc]initWithFrame:CGRectMake( self.screenSize.width/4, self.screenSize.height*2 /3 , self.screenSize.width/2, 60 )];
    
    [playButton setBackgroundColor:[UIColor whiteColor]];
    //DIVISION BUTTON TAG IS 1
    //GRADIENT
    
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = CGRectMake(0,0, playButton.frame.size.width, playButton.frame.size.height);
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:10.0f / 255.0f green:19.0f / 255.0f blue:190.0f / 255.0f alpha:1.0f] CGColor],(id)[[UIColor colorWithRed:38.0f / 255.0f green:29.0f / 232.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],                                          nil];
    //[playButton.layer insertSublayer:btnGradient atIndex:0];
    
    [playButton setBackgroundImage:[self imageFromLayer:btnGradient] forState:UIControlStateNormal];
    [playButton setBackgroundImage:[self imageFromLayer:btnGradient] forState:UIControlStateHighlighted];
    
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:38.0f / 255.0f green:100.0f / 100.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],(id)[[UIColor colorWithRed:10.0f / 255.0f green:200.0f / 255.0f blue:100.0f / 255.0f alpha:1.0f] CGColor],nil];
    [playButton setBackgroundImage:[self imageFromLayer:btnGradient] forState:UIControlStateSelected];
     
    playButton.titleLabel.text = @"Play";
    playButton.titleLabel.textColor = [SKColor blackColor];
 
    
    [self.view addSubview:playButton];

}
*/


-(void)play: (UIButton *)sender{
    [[self.view subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    

    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    // Create and configure the scene.
    GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
    scene.size  = screenSize;
    [scene setBackgroundColor:[UIColor whiteColor]];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.viewController = self;
    // Present the scene.
    [skView presentScene:scene];
}

-(void)menu:(UIButton * )sender
{
    [[self.view subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    // Create and configure the scene.
    MenuScene *scene = [MenuScene unarchiveFromFile:@"MenuScene"];
    scene.size  = screenSize;
    [scene setBackgroundColor:[UIColor whiteColor]];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.viewController = self;
    // Present the scene.
    [skView presentScene:scene];
}

-(void)loseScene: (UIButton *)sender{
    [[self.view subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    // Create and configure the scene.
    LoseScene *scene = [LoseScene unarchiveFromFile:@"LoseScene"];
    scene.size  = screenSize;
    [scene setBackgroundColor:[UIColor whiteColor]];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.viewController = self;
    // Present the scene.
    [skView presentScene:scene];
}

-(void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    
    
}

- (UIImage *)imageFromLayer:(CALayer *)layer
{
    UIGraphicsBeginImageContext([layer frame].size);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}



- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Game Center

-(void)startGameCenter{
    [self authenticateLocalPlayer];
}

-(void)authenticateLocalPlayer{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                self.gameCenterEnabled = YES;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        self.leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            
            else{
                self.gameCenterEnabled = NO;
            }
        }
    };
}

-(void)reportScore: (int)scoreInpt{
    
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:_leaderboardIdentifier];
    score.value = scoreInpt;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

@end
