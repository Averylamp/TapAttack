//
//  UIImage+Mask.h
//  Mask2
//
//  Created by Marin Todorov on 23/12/13.
//  Copyright (c) 2013 Razwware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Mask)

-(UIImage*)imageWithSize:(CGSize)size andMask:(UIImage*)mask;

@end
