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
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
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
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
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
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
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
    if (!_leaderboardIdentifier) {
        return;
    }
    
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:_leaderboardIdentifier];
    score.value = scoreInpt;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)updateAchievements{
    
    //    GKAchievement *levelAchievement = nil;
    //    GKAchievement *scoreAchievement = nil;
    //
    
    NSMutableArray *achievementsToReport = [[NSMutableArray alloc]init];
    
    int greenNumber = ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"green_Number"]).intValue;
    int yellowNumber = ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"yellow_Number"]).intValue;
    int blueNumber =  ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"blue_Number"]).intValue;
    
    int playNumber = ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"play_Number"]).intValue;
    
    int highScore = [RWGameData sharedGameData].highScore;
    
    NSLog(@"All greens - %d", ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"green_Number"]).intValue);
    NSLog(@"All yellows - %d", ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"yellow_Number"]).intValue);
    NSLog(@"All blues - %d", ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"blue_Number"]).intValue);
    
    NSLog(@"Play number - %d", ((NSNumber *)[[NSUserDefaults standardUserDefaults]objectForKey:@"play_Number"]).intValue);
    
    BOOL progressInAchievement = NO;
    NSString *achievementIdentifier;
    float progressPercent = 0.0;
    GKAchievement *playAchievement = nil;
    if (playNumber == 1) {
        achievementIdentifier = @"Play_Number_0";
        progressPercent = 100;
        progressInAchievement = YES;
    }else if (playNumber <= 5){
        achievementIdentifier = @"Play_Number_1";
        progressPercent = playNumber * 100 / 5;
        progressInAchievement = YES;
    }else if (playNumber <= 25){
        achievementIdentifier = @"Play_Number_2";
        progressPercent = playNumber  * 100 / 25;
        progressInAchievement = YES;
    }else if (playNumber <= 100){
        achievementIdentifier = @"Play_Number_3";
        progressPercent = playNumber * 100 / 5;
        progressInAchievement = YES;
    }else if (playNumber <= 1000){
        achievementIdentifier = @"Play_Number_4";
        progressPercent = playNumber* 100 / 1000;
        progressInAchievement = YES;
    }
    if (achievementIdentifier) {
        playAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
        if (progressInAchievement) {
            playAchievement.percentComplete = progressPercent;
        }
        playAchievement.showsCompletionBanner = YES;
        [achievementsToReport addObject:playAchievement];
    }
    
    
    progressInAchievement = NO;
    achievementIdentifier = nil;
    progressPercent = 0.0;
    GKAchievement *yellowAchievement = nil;
    if (yellowNumber == 1) {
        achievementIdentifier = @"Yellow_0";
        progressPercent = 100;
        progressInAchievement = YES;
    }else if (yellowNumber <= 10){
        achievementIdentifier = @"Yellow_1";
        progressPercent = yellowNumber * 100 / 10;
        progressInAchievement = YES;
    }else if (yellowNumber <= 25){
        achievementIdentifier = @"Yellow_2";
        progressPercent = yellowNumber * 100 / 25;
        progressInAchievement = YES;
    }else if (yellowNumber <= 100){
        achievementIdentifier = @"Yellow_3";
        progressPercent = yellowNumber * 100 / 100;
        progressInAchievement = YES;
    }else if (yellowNumber <= 1000){
        achievementIdentifier = @"Yellow_4";
        progressPercent = yellowNumber * 100 / 1000;
        progressInAchievement = YES;
    }
    
    
    if (achievementIdentifier) {
        yellowAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
        if (progressInAchievement) {
            yellowAchievement.percentComplete = progressPercent;
        }
        yellowAchievement.showsCompletionBanner = YES;
        
        [achievementsToReport addObject:yellowAchievement];
    }
    
    
    
    
    progressInAchievement = NO;
    achievementIdentifier = nil;
    progressPercent = 0.0;
    GKAchievement *blueAchievement = nil;
    if (blueNumber == 1) {
        achievementIdentifier = @"Blue_0";
        progressPercent = 100;
        progressInAchievement = YES;
    }else if (blueNumber <= 10){
        achievementIdentifier = @"Blue_1";
        progressPercent = blueNumber * 100 / 10;
        progressInAchievement = YES;
    }else if (blueNumber <= 25){
        achievementIdentifier = @"Blue_2";
        progressPercent = blueNumber * 100 / 25;
        progressInAchievement = YES;
    }else if (blueNumber <= 100){
        achievementIdentifier = @"Blue_3";
        progressPercent = blueNumber * 100 / 100;
        progressInAchievement = YES;
    }else if (blueNumber <= 1000){
        achievementIdentifier = @"Blue_4";
        progressPercent = blueNumber * 100 / 1000;
        progressInAchievement = YES;
    }
    
    
    if (achievementIdentifier) {
        blueAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
        if (progressInAchievement) {
            blueAchievement.percentComplete = progressPercent;
        }
        blueAchievement.showsCompletionBanner = YES;
        
        [achievementsToReport addObject:blueAchievement];
    }
    
    progressInAchievement = NO;
    achievementIdentifier = nil;
    progressPercent = 0.0;
    GKAchievement *pointsAchievement = nil;
    
    achievementIdentifier = @"Points_0";
    progressPercent = highScore *  100/50;
    pointsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    pointsAchievement.showsCompletionBanner = YES;
    pointsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:pointsAchievement];
    
    achievementIdentifier = @"Points_1";
    progressPercent = highScore * 100 / 100;
    pointsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    pointsAchievement.showsCompletionBanner = YES;
    pointsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:pointsAchievement];
    
    achievementIdentifier = @"Points_2";
    progressPercent = highScore * 100 / 200;
    pointsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    pointsAchievement.showsCompletionBanner = YES;
    pointsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:pointsAchievement];
    
    achievementIdentifier = @"Points_3";
    progressPercent = highScore * 100 / 300;
    pointsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    pointsAchievement.showsCompletionBanner = YES;
    pointsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:pointsAchievement];
    
    achievementIdentifier = @"Points_4";
    progressPercent = highScore * 100 / 400;
    pointsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    pointsAchievement.showsCompletionBanner = YES;
    pointsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:pointsAchievement];
    
    achievementIdentifier = @"Points_5";
    progressPercent = highScore * 100 / 500;
    pointsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    pointsAchievement.showsCompletionBanner = YES;
    pointsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:pointsAchievement];
    
    
    if (achievementIdentifier) {
        
        if (progressInAchievement) {
            pointsAchievement.percentComplete = progressPercent;
        }
        pointsAchievement.showsCompletionBanner = YES;
        
        [achievementsToReport addObject:pointsAchievement];
    }

    
    int totalDots = greenNumber + yellowNumber + blueNumber;
    NSLog(@"Total Dots - %d",totalDots);
    
    progressInAchievement = NO;
    achievementIdentifier = nil;
    progressPercent = 0.0;
    GKAchievement *totalDotsAchievement = nil;
    
    achievementIdentifier = @"Tap_0";
    progressPercent = totalDots *  100/500;
    totalDotsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    totalDotsAchievement.showsCompletionBanner = YES;
    totalDotsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:totalDotsAchievement];
    
    achievementIdentifier = @"Tap_1";
    progressPercent = totalDots * 100 / 2000;
    totalDotsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    totalDotsAchievement.showsCompletionBanner = YES;
    totalDotsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:totalDotsAchievement];
    
    achievementIdentifier = @"Tap_2";
    progressPercent = totalDots * 100 / 5000;
    totalDotsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    totalDotsAchievement.showsCompletionBanner = YES;
    totalDotsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:totalDotsAchievement];
    
    achievementIdentifier = @"Tap_3";
    progressPercent = totalDots * 100 / 10000;
    totalDotsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    totalDotsAchievement.showsCompletionBanner = YES;
    totalDotsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:totalDotsAchievement];
    
    achievementIdentifier = @"Tap_4";
    progressPercent = totalDots * 100 / 50000;
    totalDotsAchievement = [[GKAchievement alloc]initWithIdentifier:achievementIdentifier];
    totalDotsAchievement.showsCompletionBanner = YES;
    totalDotsAchievement.percentComplete = progressPercent;
    [achievementsToReport addObject:totalDotsAchievement];
    
    
    
    if (achievementIdentifier) {
        
        if (progressInAchievement) {
            totalDotsAchievement.percentComplete = progressPercent;
        }
        totalDotsAchievement.showsCompletionBanner = YES;
        
        [achievementsToReport addObject:totalDotsAchievement];
    }
    
    
    
    
    /*
     if (_currentAdditionCounter == 0) {
     if (_level <= 3) {
     progressPercentage = _level * 100 / 3;
     achievementIdentifier = @&quot;Achievement_Level3&quot;;
     progressInLevelAchievement = YES;
     }
     else if (_level < 6){
     progressPercentage = _level * 100 / 5;
     achievementIdentifier = @&quot;Achievement_Level5Complete&quot;;
     progressInLevelAchievement = YES;
     }
     }
     
     
     if (progressInLevelAchievement) {
     levelAchievement = [[GKAchievement alloc] initWithIdentifier:achievementIdentifier];
     levelAchievement.percentComplete = progressPercentage;
     }
     
     
     if (_score <= 50) {
     progressPercentage = _score * 100 / 50;
     achievementIdentifier = @&quot;Achievement_50Points&quot;;
     }
     else if (_score <= 120){
     progressPercentage = _score * 100 / 120;
     achievementIdentifier = @&quot;Achievement_120Points&quot;;
     }
     else{
     progressPercentage = _score * 100 / 180;
     achievementIdentifier = @&quot;Achievement_180Points&quot;;
     }
     
     scoreAchievement = [[GKAchievement alloc] initWithIdentifier:achievementIdentifier];
     scoreAchievement.percentComplete = progressPercentage;
     
     NSArray *achievements = (progressInLevelAchievement) ? @[levelAchievement, scoreAchievement] : @[scoreAchievement];
     
     [GKAchievement reportAchievements:achievements withCompletionHandler:^(NSError *error) {
     if (error != nil) {
     NSLog(@&quot;%@&quot;, [error localizedDescription]);
     }
     }];
     */
    if (achievementsToReport.count) {
        
        NSLog(@"Updating Achivements");
        [GKAchievement reportAchievements:achievementsToReport withCompletionHandler:^(NSError *error) {
            if (error != nil) {
                NSLog(@"Error - %@", [error localizedDescription]);
            }
        }];
    }
    
    
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
