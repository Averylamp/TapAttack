//
//  menuViewController.m
//  GreenRedBlackGame
//
//  Created by Avery Lamp on 12/27/14.
//  Copyright (c) 2014 Avery Lamp. All rights reserved.
//

#import "menuViewController.h"

@interface menuViewController ()
@property CGSize screenSize;
@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
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
    //[self.view addSubview:testbutton];
    
    
    
    
    
    UIButton *playButton = [[UIButton alloc]initWithFrame:CGRectMake( self.screenSize.width/4, self.screenSize.height*2 /3 , self.screenSize.width/2, 60 )];
    playButton.titleLabel.text = @"Play";
    playButton.titleLabel.textColor = [UIColor whiteColor];
    [playButton setBackgroundColor:[UIColor blueColor]];
    //DIVISION BUTTON TAG IS 1
    //GRADIENT
    
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = CGRectMake(0,0, playButton.frame.size.width, playButton.frame.size.height);
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:10.0f / 255.0f green:19.0f / 255.0f blue:190.0f / 255.0f alpha:1.0f] CGColor],(id)[[UIColor colorWithRed:38.0f / 255.0f green:29.0f / 232.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],                                          nil];
    //[divisionButton.layer insertSublayer:btnGradient atIndex:0];
    
   [playButton setBackgroundImage:[self imageFromLayer:btnGradient] forState:UIControlStateNormal];
    [playButton setBackgroundImage:[self imageFromLayer:btnGradient] forState:UIControlStateHighlighted];
    
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:38.0f / 255.0f green:100.0f / 100.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],(id)[[UIColor colorWithRed:10.0f / 255.0f green:200.0f / 255.0f blue:100.0f / 255.0f alpha:1.0f] CGColor],nil];
    [playButton setBackgroundImage:[self imageFromLayer:btnGradient] forState:UIControlStateSelected];
    [self.view addSubview:playButton];
    
    NSLog(@"HERE");
}
- (UIImage *)imageFromLayer:(CALayer *)layer
{
    UIGraphicsBeginImageContext([layer frame].size);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
