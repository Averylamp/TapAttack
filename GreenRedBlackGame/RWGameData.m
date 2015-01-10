//
//  RWGameData.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 1/2/15.
//  Copyright (c) 2015 Avery Lamp. All rights reserved.
//

#import "RWGameData.h"

@implementation RWGameData

static NSString* const SSGameDataHighScoreKey = @"highScore";
static NSString* const SSGameDataPilotPhotoKey = @"pilotPhoto";
static NSString* const SSGameDataAllSpritesKey = @"allSKSpriteNodes";
static NSString* const SSGameDataLocalInUseSpritesKey = @"localInUseSpriteNodes";
static NSString* const SSGameDataActiveSpriteDictionary = @"activeSpriteDictionary";
-(void)reset
{

}
+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}

-(NSArray *)takenPhotos{
    if(!_takenPhotos){
        _takenPhotos = [[NSArray alloc]init];
    }
    return _takenPhotos;
}

-(NSArray * )allSprites{
    if(!_allSprites){
        _allSprites = [[NSArray alloc]init];
    }
    return _allSprites;
}
-(NSArray *)inUseLocalSprites
{
    if(!_inUseLocalSprites)
    {
        _inUseLocalSprites = [[NSArray alloc]init];
    }
    return _inUseLocalSprites;
}
-(NSMutableDictionary * )activeSpriteDictionary
{
    if(!_activeSpriteDictionary){
        _activeSpriteDictionary = [[NSMutableDictionary alloc]init];
    }
    return _activeSpriteDictionary;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
   [aCoder encodeDouble:self.highScore forKey: SSGameDataHighScoreKey];
    if (self.takenPhotos) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.takenPhotos];
        [aCoder encodeObject:data forKey: SSGameDataPilotPhotoKey];
    }
    if (self.allSprites) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.allSprites];
        [aCoder encodeObject:data forKey: SSGameDataAllSpritesKey];
    }
    if (self.inUseLocalSprites) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.inUseLocalSprites];
        [aCoder encodeObject:data forKey: SSGameDataLocalInUseSpritesKey];
    }
    if(self.activeSpriteDictionary){
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.activeSpriteDictionary];
        [aCoder encodeObject:data forKey:SSGameDataActiveSpriteDictionary];
    }
    
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _highScore = [decoder decodeDoubleForKey: SSGameDataHighScoreKey];
        NSData* imageData = [decoder decodeObjectForKey: SSGameDataPilotPhotoKey];
        if (imageData) {
            self.takenPhotos= [NSKeyedUnarchiver unarchiveObjectWithData:imageData];
        }
        self.allSprites = [NSKeyedUnarchiver unarchiveObjectWithData:[decoder decodeObjectForKey:SSGameDataAllSpritesKey]];
        self.inUseLocalSprites = [NSKeyedUnarchiver unarchiveObjectWithData:[decoder decodeObjectForKey:SSGameDataLocalInUseSpritesKey]];
        self.activeSpriteDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:[decoder decodeObjectForKey:SSGameDataActiveSpriteDictionary]];
    }
    return self;
}
+(instancetype)loadInstance
{
    NSData* decodedData = [NSData dataWithContentsOfFile: [RWGameData filePath]];
    if (decodedData) {
        RWGameData* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    
    return [[RWGameData alloc] init];
}

+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gameData"];
    }
    return filePath;
}

-(void)save
{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[RWGameData filePath] atomically:YES];
}
@end
