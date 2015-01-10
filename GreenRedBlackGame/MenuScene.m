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
@interface  MenuScene()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property CGSize screenSize;
@property SKSpriteNode *playButton;
@property NSMutableArray *allNodes;
@end
@implementation MenuScene

-(void)didMoveToView:(SKView *)view
{
    if ([self.view isKindOfClass:[SKView class]]) {
        NSLog(@"IT IS A SKVIEW");
    }else{
        NSLog(@"IT IS A UIVIEW");
    }
    
    
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
    [self addChild:takePhoto];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"playButton"]){
        SKSpriteNode *playButton = (SKSpriteNode *)node;
        [playButton runAction: [SKAction scaleTo:2.8 duration:0.15]];
    }
    if([node.name isEqualToString:@"TakePhotoButton"]){
        [self performSelector:@selector(takePhoto) withObject:nil afterDelay:0.3];
        
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
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"playButton"]){
        
        [self.playButton runAction: [SKAction scaleTo:2.5 duration:0.1]];
        [self.viewController play:nil];
        
    }else{
        [self.playButton runAction: [SKAction scaleTo:2.5 duration:0.15]];
    }
}
-(void)update:(NSTimeInterval)currentTime{
    if(self.paused){
        return;
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
                                                                      NSLog(@"Number of savedPhotos - %d",[takenPhotos count]);
                                   [RWGameData sharedGameData].takenPhotos = takenPhotos;
                                   [[RWGameData sharedGameData] save];
                                   
                                   
                                   
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
@end
