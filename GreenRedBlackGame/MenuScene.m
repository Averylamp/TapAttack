//
//  MenuScene.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 1/1/15.
//  Copyright (c) 2015 Avery Lamp. All rights reserved.
//

#import "MenuScene.h"
#import "UIImage+Mask.h"
#import "RWGameData.h"
#import <GameKit/GameKit.h>
@interface  MenuScene()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property CGSize screenSize;
@property SKSpriteNode *playButton;
@property NSMutableArray *allNodes;
@property   UIView *instructionsView;
@end
@implementation MenuScene

-(void)didMoveToView:(SKView *)view
{
    
    [GKAchievement loadAchievementsWithCompletionHandler:^(NSArray *achievements, NSError *error) {
        NSLog(@"count - %lu",(unsigned long)achievements.count);
        
        for (GKAchievement *a in achievements) {
            NSLog(@"Achievement - %@, progress %f, completed %d",a.identifier, a.percentComplete, a.completed);
        }
        
    }];
   
    
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    //self.screenSize = CGSizeMake(screenBounds.size.width, screenBounds.size.height);
    self.screenSize= screenSize;
    NSLog(@"Screen Size - %f , %f",self.screenSize.width,self.screenSize.height);
    SKLabelNode *titleLabel = [[SKLabelNode alloc]initWithFontNamed:@"Party LET"];
    //UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.screenSize.width, self.screenSize.height/3.5)];
    titleLabel.text = @"Tap Attack!";
    titleLabel.xScale =  screenScale / 2;
    titleLabel.yScale =  screenScale / 2;
    //titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.fontColor = [UIColor blackColor];
    titleLabel.fontSize = 125.0f;
    titleLabel.position = CGPointMake(self.screenSize.width/2,self.screenSize.height - self.screenSize.height/6  * screenScale / 2);
    //titleLabel.font = [UIFont fontWithName:@"Party LET" size:50.0f];
    [self addChild:titleLabel];
    
    SKSpriteNode * playButton = [[SKSpriteNode alloc]initWithImageNamed:@"playButton"];
    playButton.position = CGPointMake(self.screenSize.width / 2, self.screenSize.height/3);
    playButton.xScale = 2.5* screenScale / 2;
    playButton.yScale = 2.5* screenScale / 2;
    playButton.name = @"playButton";
    self.playButton = playButton;
    [self addChild:playButton];
    //NSLog(@"HERE");
    
    SKSpriteNode *sprite = [[SKSpriteNode alloc]initWithImageNamed:@"SealFace"];
    sprite.position = CGPointMake(self.screenSize.width/2,self.screenSize.height/2);
    sprite.size = CGSizeMake(140, 140);
    //[self addChild:sprite];
    SKLabelNode *takePhoto;
    takePhoto = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
    takePhoto.name = @"TakePhotoButton";
    takePhoto.fontSize = 55.0;
    takePhoto.text = @"Add your own circles";
    takePhoto.position = CGPointMake(self.screenSize.width/2,40);
    takePhoto.fontColor = [SKColor blackColor];
    //[self addChild:takePhoto];
    
    //[self settupAllSpriteNodes];
    
    BOOL firstUse = YES;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"firstUse"]) {
        firstUse = ((NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:@"firstUse"]).boolValue;
    }

    if (firstUse) {
        NSLog(@"Setting Queue");
        int64_t delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            NSLog(@"Setup instructions");
            [self setupInstructions];
        });

        
    }
    
}

-(void)setupInstructions{
    
    UIView *instructionsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width  * 0.9, self.view.frame.size.height * 0.82)];
    instructionsView.layer.borderColor = [UIColor blackColor].CGColor;
    instructionsView.layer.borderWidth = 2;
    instructionsView.center = self.view.center;
    instructionsView.backgroundColor = [UIColor whiteColor];
    self.instructionsView = instructionsView;
    [self.viewController.view insertSubview:instructionsView atIndex:0];
    
    UIButton *exitButton = [[UIButton alloc]initWithFrame:CGRectMake(instructionsView.frame.size.width - 35, 12, 30, 30)];
    [exitButton setBackgroundImage:[UIImage imageNamed:@"exitButton"] forState:UIControlStateNormal];
    [exitButton addTarget:self action:@selector(exitInstructionsPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.instructionsView addSubview: exitButton];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, instructionsView.frame.size.width, 50)];
    titleLabel.text = @"How to Play";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"Panton-Black" size:40];
    [self.instructionsView addSubview: titleLabel];
    
    UILabel *greenInstructions = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, instructionsView.frame.size.width - 7, 40)];
    greenInstructions.text = @"Tap all Green dots";
    greenInstructions.font = [UIFont fontWithName:@"Panton-Light" size:28];
    greenInstructions.textAlignment = NSTextAlignmentRight;
    [self.instructionsView addSubview:greenInstructions];
    UIView *green = [[UIView alloc]initWithFrame:CGRectMake(5, 90, 40, 40)];
    green.layer.cornerRadius = 20;
    green.backgroundColor = [UIColor greenColor];
    [self.instructionsView addSubview:green];

    UILabel *redInstructions = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, instructionsView.frame.size.width - 7, 40)];
    redInstructions.text = @"Don't tap Red dots";
    redInstructions.font = [UIFont fontWithName:@"Panton-Light" size:28];
    redInstructions.textAlignment = NSTextAlignmentRight;
    [self.instructionsView addSubview:redInstructions];
    UIView *red = [[UIView alloc]initWithFrame:CGRectMake(5, 150, 40, 40)];
    red.layer.cornerRadius = 20;
    red.backgroundColor = [UIColor redColor];
    [self.instructionsView addSubview:red];
    
    UILabel *yellowInstructions = [[UILabel alloc]initWithFrame:CGRectMake(0, 210, instructionsView.frame.size.width - 7, 40)];
    yellowInstructions.text = @"Yellow = Extra points";
    yellowInstructions.font = [UIFont fontWithName:@"Panton-Light" size:26];
    yellowInstructions.textAlignment = NSTextAlignmentRight;
    [self.instructionsView addSubview:yellowInstructions];
    UIView *yellow = [[UIView alloc]initWithFrame:CGRectMake(5, 210, 40, 40)];
    yellow.layer.cornerRadius = 20;
    yellow.backgroundColor = [UIColor colorWithRed:1.0f green:180.0/255.0 blue:0.0f alpha:1.0f];
    [self.instructionsView addSubview:yellow];
    
    UILabel *doubleInstructions = [[UILabel alloc]initWithFrame:CGRectMake(0, 270, instructionsView.frame.size.width - 7, 40)];
    doubleInstructions.text = @"Double all Points";
    doubleInstructions.font = [UIFont fontWithName:@"Panton-Light" size:28];
    doubleInstructions.textAlignment = NSTextAlignmentRight;
    [self.instructionsView addSubview:doubleInstructions];
    UIImageView *doublePoints = [[UIImageView alloc]initWithFrame:CGRectMake(5, 270, 40, 40)];
    doublePoints.image = [UIImage imageNamed:@"Times2PowerUp"];
    doublePoints.contentMode = UIViewContentModeScaleAspectFill;
    [self.instructionsView addSubview:doublePoints];
    
    
}

-(void) exitInstructionsPressed{
    [self.instructionsView removeFromSuperview];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGFloat screenScale = [[UIScreen mainScreen] scale];

    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"playButton"]){
        SKSpriteNode *playButton = (SKSpriteNode *)node;
        [playButton runAction: [SKAction scaleTo:2.8 * screenScale / 2 duration:0.15]];
    }
    if([node.name isEqualToString:@"TakePhotoButton"]){
        [self performSelector:@selector(takePhoto) withObject:nil afterDelay:0.3];
    }
    if([[node.name substringToIndex:10]isEqualToString:@"Green Node"]){
        int zpos = [[[RWGameData sharedGameData].activeSpriteDictionary valueForKey:node.name] intValue];
        if(zpos ==2){
            zpos = 1;
            ((SKShapeNode*)[[node children] firstObject]).fillColor = SKColor.redColor;
        }else{
            zpos = 2;
            ((SKShapeNode*)[[node children] firstObject]).fillColor = SKColor.greenColor;
        }
        [[RWGameData sharedGameData].activeSpriteDictionary setValue:[NSNumber numberWithInt:zpos] forKey:node.name];
        [[RWGameData sharedGameData]save];
    }
}

-(void)takePhoto{
    self.paused = YES;
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    imagePickerController.delegate = self;
    
    UIWindow* appWindow = [UIApplication sharedApplication].windows.firstObject;
    [appWindow.rootViewController presentViewController:imagePickerController animated:YES completion:nil];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if(![node.name isEqualToString:@"playButton"]){
        [self.playButton runAction: [SKAction scaleTo:2.5 duration:0.15]];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"playButton"]){
        
        [self.playButton runAction: [SKAction scaleTo:2.5 * screenScale / 2 duration:0.1]];
        [self.viewController play:nil];
        
    }else{
        [self.playButton runAction: [SKAction scaleTo:2.5 * screenScale / 2 duration:0.15]];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   
                                   
                                   UIImage* photoTaken = info[UIImagePickerControllerOriginalImage];
                                   NSLog(@"Image Size %f , %f", photoTaken.size.width, photoTaken.size.height);
                                   
                                   //UIImage* pilotImage =photoTaken;
                                   // UIImage* pilotImage =[photoTaken imageWithSize: CGSizeMake(140, 140) andMask:[UIImage imageNamed:@"25_mask.png"]];
                                   UIImage *pilotImage = [self squareImageFromImage:photoTaken scaledToSize:400];
                                   //NSData *imageData = UIImagePNGRepresentation(pilotImage);
                                   NSLog(@"Image Size %f , %f", pilotImage.size.width, pilotImage.size.height);
                                   NSMutableArray *takenPhotos = [[RWGameData sharedGameData].takenPhotos mutableCopy];
                                   
                                   [takenPhotos addObject:pilotImage];
                                   NSLog(@"Number of savedPhotos - %lu",(unsigned long)[takenPhotos count]);
                                   [RWGameData sharedGameData].takenPhotos = takenPhotos;
                                   [[RWGameData sharedGameData] save];
                                   
                                   
                                   [self settupAllSpriteNodes];
                                   self.paused = NO;
                               }];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   self.paused = NO;
                               }];
}

- (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize {
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (image.size.width > image.size.height) {
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else {
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, scaleTransform);
    
    [image drawAtPoint:origin];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)settupAllSpriteNodes
{
    SKSpriteNode *sprite;
    
    NSMutableArray *allSprites = [[RWGameData sharedGameData].allSprites mutableCopy];
    for(NSString *s in [MenuScene arrayOfCircleImageNames]){
        sprite= [[SKSpriteNode alloc]initWithImageNamed:s];
        sprite.name = [@"Green Node with Image " stringByAppendingString:s];
        sprite.size = CGSizeMake(135, 135);
        if(![allSprites containsObject:sprite]){
            [allSprites addObject:sprite];
        }
        if(![[RWGameData sharedGameData].activeSpriteDictionary objectForKey:sprite.name]){
            [[RWGameData sharedGameData].activeSpriteDictionary setValue:[NSNumber numberWithInt:2] forKey:sprite.name];
        }
    }
    for(UIImage *i in [RWGameData sharedGameData].takenPhotos){
        UIImage *temp = [i imageWithSize:CGSizeMake(140, 140) andMask:[UIImage imageNamed:@"25_mask.png"]];
        NSData *data = UIImagePNGRepresentation(temp);
        data = [data subdataWithRange:NSMakeRange(0, 800)];
        NSLog(@"Data - %@ " , data);
        sprite = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImage:temp]];
        sprite.name = [NSString stringWithFormat: @"Green Node with Saved Image %@",data];
        //NSLog(sprite.name);
        sprite.size = CGSizeMake(135, 135);
        sprite.xScale = 4.0/3.0;
        sprite.yScale = 4.0/3.0;
        if(![allSprites containsObject:sprite]){
            [allSprites addObject:sprite];
        }
        if(![[RWGameData sharedGameData].activeSpriteDictionary objectForKey:sprite.name]){
            [[RWGameData sharedGameData].activeSpriteDictionary setValue:[NSNumber numberWithInt:2] forKey:sprite.name];
        }
    }
    
    [RWGameData sharedGameData].allSprites = allSprites;
    NSLog(@"Num of Total Sprites - %lu", (unsigned long)[[RWGameData sharedGameData].allSprites count]);
    [[RWGameData sharedGameData]save];
    [self createRowOfSpritesAtHeight: 600];
    
}
-(void)createRowOfSpritesAtHeight:(int) height
{
    int currentwidth = 0;
    NSString *lastName1 = @"a",*lastName2 = @"b",*lastName3 = @"c";
    while (currentwidth < self.screenSize.width +3000) {
        
        int index = arc4random() % [[RWGameData sharedGameData].allSprites count];
        SKSpriteNode *sprite = [[[RWGameData sharedGameData].allSprites objectAtIndex:index] copy];
        while ([sprite.name isEqualToString:lastName1]||[sprite.name isEqualToString:lastName2]||[sprite.name isEqualToString:lastName3]) {
            int index = arc4random() % [[RWGameData sharedGameData].allSprites count];
            sprite = [[[RWGameData sharedGameData].allSprites objectAtIndex:index] copy];
        }
        lastName3 = lastName2;
        lastName2 = lastName1;
        lastName1 = sprite.name;
        
        sprite = [self returnNodeWithBackground:sprite];
        
        
        SKAction *action = [SKAction moveByX:-100 y:0 duration:1.5];
        SKAction *repeatAction = [SKAction repeatActionForever:action];
        [sprite runAction:repeatAction];
        
        sprite.position = CGPointMake(currentwidth, height);
        currentwidth += 165;
        [self addChild:sprite];
    }
    
    
    
    
}

-(SKSpriteNode *)returnNodeWithBackground:(SKSpriteNode *)sprite
{
    int zpos = [((NSNumber *)[[RWGameData sharedGameData].activeSpriteDictionary valueForKey:sprite.name])intValue];
    if (zpos ==2) {
        sprite.zPosition = 2;
        CGRect circle = CGRectMake(-75, -75, 150.0,150.0);
        SKShapeNode *node = [[SKShapeNode alloc] init];
        node.name = @"Green Back Circle";
        ((SKShapeNode*)node).path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
        ((SKShapeNode*)node).fillColor = SKColor.greenColor;
        ((SKShapeNode*)node).strokeColor = nil;
        node.position = CGPointZero;
        ((SKShapeNode*)node).xScale=1.0;
        ((SKShapeNode*)node).yScale=1.0;
        if([[sprite name]length]>21){
            if ([[[sprite name]substringToIndex:21]  isEqualToString:@"Green Node with Saved"]) {
                node.xScale = 3.0/4.0;
                node.yScale = 3.0/4.0;
            }
        }
        node.zPosition = -4;
        [sprite addChild:node];
    }else if(zpos ==1){
        sprite.zPosition = 1;
        CGRect circle = CGRectMake(-75, -75, 150.0,150.0);
        SKShapeNode *node = [[SKShapeNode alloc] init];
        node.name = @"Red Back Circle";
        ((SKShapeNode*)node).path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
        ((SKShapeNode*)node).fillColor = SKColor.redColor;
        ((SKShapeNode*)node).strokeColor = nil;
        node.position = CGPointZero;
        ((SKShapeNode*)node).xScale=1.0;
        ((SKShapeNode*)node).yScale=1.0;
        if([[sprite name]length]>15){
            if ([[[sprite name]substringToIndex:15]  isEqualToString:@"Green Node with"]) {
                node.xScale = 3.0/4.0;
                node.yScale = 3.0/4.0;
            }
        }
        node.zPosition = -4;
        [sprite addChild:node];
    }
    return sprite;
}


+(NSArray*)arrayOfCircleImageNames{
    return [NSArray arrayWithObjects:@"SealFace",@"OwlFace", @"LemurFace",@"DogFace",@"DogFace2",@"BirdFace",nil];
}

-(void)update:(NSTimeInterval)currentTime{
    if(self.paused){
        return;
    }
}


@end
