//
//  RWGameData.h
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 1/2/15.
//  Copyright (c) 2015 Avery Lamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWGameData : NSObject<NSCoding>
@property int highScore;

+(instancetype)sharedGameData;
-(void)save;
@end
