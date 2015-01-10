//
//  UIImage+Mask.m
//  Mask2
//
//  Created by Marin Todorov on 23/12/13.
//  Copyright (c) 2013 Razwware. All rights reserved.
//

#import "UIImage+Mask.h"

@implementation UIImage (Mask)

-(UIImage*)imageWithSize:(CGSize)size andMask:(UIImage*)mask
{
    //calculate resized and scaled size
    CGSize resizedImageFitAspect;
    if (self.size.height>self.size.width) {
        resizedImageFitAspect = CGSizeMake(self.size.width * size.height / self.size.height,
                                           size.height);
    } else {
        resizedImageFitAspect = CGSizeMake(size.width,
                                           self.size.height * size.width / self.size.width);
    }
    
    //resize to target size
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(size.width/2 - resizedImageFitAspect.width/2, size.height/2 - resizedImageFitAspect.height/2, resizedImageFitAspect.width, resizedImageFitAspect.height)];
    UIImage* resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //create mask
    CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(mask.CGImage),
                                             CGImageGetHeight(mask.CGImage),
                                             CGImageGetBitsPerComponent(mask.CGImage),
                                             CGImageGetBitsPerPixel(mask.CGImage),
                                             CGImageGetBytesPerRow(mask.CGImage),
                                             CGImageGetDataProvider(mask.CGImage),
                                             NULL, // Decode is null
                                             YES // Should interpolate
                                             );
    
    //apply mask to resized image
    CGImageRef maskedReference = CGImageCreateWithMask(resizedImage.CGImage, imageMask);
    CGImageRelease(imageMask);
    
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedReference];
    CGImageRelease(maskedReference);
    
    //return non-retained result
    return maskedImage;
}

@end