//
//  GameScene.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 12/27/14.
//  Copyright (c) 2014 Avery Lamp. All rights reserved.
//

#import "GameScene.h"
@interface GameScene()
@property double lastTime;
@property double numberOfUpdates;
@property double score;
@property double spawnRate;
@property double spawnTime;
@property int redSpawnRate;
@property int redLastNumberOfUpdates;
@property double timeToDissappear;
@property double timeToDissappearRate;
@property NSMutableArray *arrayOfClickableCircles;
@property NSMutableArray *arrayOfTimesToDissappear;
@property NSMutableArray *arrayOfRedCircles;
@property NSMutableArray *arrayOfRedTimesToDissappear;
@property BOOL started;
@end
@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.spawnTime = 0;
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    myLabel.color = [UIColor blackColor];
    myLabel.text = @"3";
    myLabel.fontSize = 200;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    myLabel.xScale = 0.25;
    
    myLabel.yScale = 0.25;
    [self addChild:myLabel];
    
    [myLabel runAction: [SKAction scaleTo:1.0 duration:1] completion:^{
        myLabel.text = @"2";
        NSLog(@"2");
        myLabel.xScale = 0.25;
        myLabel.yScale = 0.25;
        [myLabel runAction: [SKAction scaleTo:1.0 duration:1]completion:^{
            myLabel.text = @"1";
            NSLog(@"1");
            myLabel.xScale = 0.25;
            myLabel.yScale = 0.25;
            [myLabel runAction:[SKAction scaleTo:1.0 duration:1] completion:^{
                [myLabel removeFromParent];
                self.paused = NO;
                self.started = YES;
            }];
            
        }];
    }];
    self.redSpawnRate = 300;
    
    
    
    self.arrayOfClickableCircles =[[NSMutableArray alloc]init];
    self.arrayOfTimesToDissappear =[[NSMutableArray alloc]init];
    self.arrayOfRedCircles =[[NSMutableArray alloc]init];
    self.arrayOfRedTimesToDissappear =[[NSMutableArray alloc]init];
    self.spawnRate = .75;
    self.timeToDissappear = 1.5;
    self.timeToDissappearRate = .5;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    self.screenSize = screenSize;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        
        /*
         CGRect circle = CGRectMake(-55, -55, 110.0,110.0);
         SKShapeNode *shapeNode = [[SKShapeNode alloc] init];
         shapeNode.path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
         shapeNode.fillColor = SKColor.greenColor;
         shapeNode.strokeColor = nil;
         shapeNode.position = location;
         shapeNode.xScale=0.1;
         shapeNode.yScale=0.1;
         [self addChild:shapeNode];
         [shapeNode runAction:[SKAction  scaleTo:1 duration:0.15]completion:^{
         [self.arrayOfClickableCircles addObject:shapeNode];
         [self.arrayOfTimesToDissappear addObject:[NSDecimalNumber numberWithDouble:CACurrentMediaTime() + self.timeToDissappear]];
         } ];
         NSLog(@"TimeTODissappear - %f",CACurrentMediaTime() + self.timeToDissappear);
         */
    }
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = (UITouch *)[[touches allObjects]firstObject];
    CGPoint location = [touch locationInNode:self];
    
    NSLog(@"Position x - %f , y - %f", location.x, location.y);
    
    
}

-(void)lose{
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text =[NSString stringWithFormat: @"You Lose\nYour final score was %f",self.score];
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
    
    
    
}

-(void) spawnGreen{
    BOOL valid = NO;
    CGPoint location;
    while (!valid){
        int x= (arc4random() % (int)(self.screenSize.width - 110)) + 55, y = (arc4random() % (int) (self.screenSize.height - 110)) + 55;
        valid = YES;
        for(SKShapeNode *s in self.arrayOfClickableCircles){
            if(ABS(x-s.position.x)<110&&ABS(y-s.position.y)<110){
                valid = NO;
                NSLog(@"TOO CLOSE");
            }
        }
        for(SKShapeNode *s in self.arrayOfRedCircles){
            if(ABS(x-s.position.x)<120&&ABS(y-s.position.y)<120){
                valid = NO;
                NSLog(@"TOO CLOSE");
            }
        }
        location = CGPointMake(x, y);
    }
    CGRect circle = CGRectMake(-55, -55, 110.0,110.0);
    SKShapeNode *shapeNode = [[SKShapeNode alloc] init];
    shapeNode.path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
    shapeNode.fillColor = SKColor.greenColor;
    shapeNode.strokeColor = nil;
    shapeNode.position = location;
    shapeNode.xScale=0.1;
    shapeNode.yScale=0.1;
    [self addChild:shapeNode];
    [self.arrayOfClickableCircles addObject:shapeNode];
    [self.arrayOfTimesToDissappear addObject:[NSDecimalNumber numberWithDouble:CACurrentMediaTime() + self.timeToDissappear + .15]];
    [shapeNode runAction:[SKAction  scaleTo:1 duration:0.15]completion:^{
        
    } ];
    //NSLog(@"TimeTODissappear - %f",CACurrentMediaTime() + self.timeToDissappear);
    
}
-(void)spawnRed{
    
    BOOL valid = NO;
    CGPoint location;
    while (!valid){
        int x= (arc4random() % (int)(self.screenSize.width - 130)) + 65, y = (arc4random() % (int) (self.screenSize.height - 130)) + 65;
        valid = YES;
        for(SKShapeNode *s in self.arrayOfClickableCircles){
            if(ABS(x-s.position.x)<120&&ABS(y-s.position.y)<120){
                valid = NO;
                //NSLog(@"TOO CLOSE");
            }
        }
        for(SKShapeNode *s in self.arrayOfRedCircles){
            if(ABS(x-s.position.x)<90&&ABS(y-s.position.y)<90){
                valid = NO;
                NSLog(@"RED TOO CLOSE");
            }
        }
        location = CGPointMake(x, y);
    }
    CGRect circle = CGRectMake(-65, -65, 130.0,130.0);
    SKShapeNode *shapeNode = [[SKShapeNode alloc] init];
    shapeNode.path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
    shapeNode.fillColor = SKColor.redColor;
    shapeNode.strokeColor = nil;
    shapeNode.position = location;
    shapeNode.xScale=0.2;
    shapeNode.yScale=0.2;
    [self addChild:shapeNode];
    [self.arrayOfRedCircles addObject:shapeNode];
    [self.arrayOfRedTimesToDissappear addObject:[NSDecimalNumber numberWithDouble:CACurrentMediaTime() + self.timeToDissappear + 0.15]];
    [shapeNode runAction:[SKAction  scaleTo:1 duration:0.25]completion:^{
        
    } ];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    if (self.started){
        BOOL greenAdded=NO;
        if(self.spawnTime ==0){
            self.spawnTime = CACurrentMediaTime();
            [self spawnGreen];
            self.spawnTime = self.spawnTime + self.spawnRate;
            greenAdded = YES;
        }
        self.redLastNumberOfUpdates = self.redLastNumberOfUpdates + 1;
        if(self.numberOfUpdates ==600 || (self.numberOfUpdates > 600 &&(int) self.redLastNumberOfUpdates % (int)self.redSpawnRate==0)){
            //NSLog(@"SPAWN RED");
            if(!greenAdded){
                self.redLastNumberOfUpdates = 1;
                self.redSpawnRate = self.redSpawnRate -19;
                //[self spawnRed];
            }else{
                self.redLastNumberOfUpdates = self.redLastNumberOfUpdates - 1;
            }
        }
        
        
        if(self.lastTime < self.spawnTime && self.spawnTime < currentTime){
            [self spawnGreen];
            double chanceOfRedSpawn =  1-(.30  / (1 + 20 *pow(M_E, -.0008 * (self.numberOfUpdates* 2))));
            if(self.numberOfUpdates > 600){
                NSLog(@"Chance of Red Spawn - %f" , chanceOfRedSpawn);
                if (arc4random() %100 > chanceOfRedSpawn * 100) {
                    [self spawnRed];
                }
            }
            self.spawnTime = self.spawnTime + self.spawnRate;
            //NSLog(@"Spawn Rate - %f ",self.spawnRate );
            
        }
        self.numberOfUpdates = self.numberOfUpdates + 1;
        self.spawnRate = .75-(0.60 / (1 + 20 *pow(M_E, -.0008 * (self.numberOfUpdates+2800))));
        
        
        
        double  firstTimeToDissappear = ((NSDecimalNumber*) [self.arrayOfTimesToDissappear firstObject]).doubleValue;
        id timeInArray = [self.arrayOfTimesToDissappear firstObject];
        
        SKShapeNode *shapeToDissappear = (SKShapeNode *)[self.arrayOfClickableCircles firstObject];
        if(self.lastTime<firstTimeToDissappear && firstTimeToDissappear < currentTime){
            //NSLog(@"firstTime - %f currentTime - %f",firstTimeToDissappear,currentTime);
            [shapeToDissappear runAction:[SKAction scaleTo:0 duration:0.1] completion:^{
                if (shapeToDissappear.fillColor == SKColor.greenColor){
                    //[self lose];
                }
                [shapeToDissappear removeFromParent];
                [self.arrayOfClickableCircles removeObject:shapeToDissappear];
            }];
            [self.arrayOfTimesToDissappear removeObject:timeInArray];
            
        }
        
        firstTimeToDissappear = ((NSDecimalNumber*) [self.arrayOfRedTimesToDissappear firstObject]).doubleValue;
        timeInArray = [self.arrayOfRedTimesToDissappear firstObject];
        
        shapeToDissappear = (SKShapeNode *)[self.arrayOfRedCircles firstObject];
        if(self.lastTime<firstTimeToDissappear && firstTimeToDissappear < currentTime){
            //NSLog(@"firstTime - %f currentTime - %f",firstTimeToDissappear,currentTime);
            [shapeToDissappear runAction:[SKAction scaleTo:0 duration:0.25] completion:^{
                [shapeToDissappear removeFromParent];
                [self.arrayOfRedCircles removeObject:shapeToDissappear];
            }];
            [self.arrayOfRedTimesToDissappear removeObject:timeInArray];
            
        }
        
        
        
        self.lastTime= currentTime;
    }
}


@end
