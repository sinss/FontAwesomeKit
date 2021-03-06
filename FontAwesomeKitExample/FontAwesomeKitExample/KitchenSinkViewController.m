//
//  ViewController.m
//  FontAwesomeKitExample
//
//  Created by 钟 子豪 on 13-2-15.
//  Copyright (c) 2013年 Pride Chung. All rights reserved.
//

#import "KitchenSinkViewController.h"
#import "FontAwesomeKit.h"

@interface KitchenSinkViewController ()
@property (weak, nonatomic) IBOutlet UILabel *facebookLabel;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gradientImageView;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (weak, nonatomic) IBOutlet UILabel *okLabel;
@end

@implementation KitchenSinkViewController

- (void)awakeFromNib
{
	// using Font-Awesome on tabBar image.
	UIImage *tabBarIcon = [FontAwesomeKit imageForIcon:FAKIconHeart
											 imageSize:FAKImageSizeTabbar
											  fontSize:29
											attributes:nil];
	self.tabBarItem.image = tabBarIcon;
	self.tabBarItem.title = @"Kitchen Sink";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// using Font-Awesome on UIBarButtonItem
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:FAKIconCog
																			 style:UIBarButtonItemStyleBordered
																			target:nil
																			action:nil];
	[self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{UITextAttributeFont:[FontAwesomeKit fontWithSize:20]}
										forState:UIControlStateNormal];
	
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:FAKIconRefresh
																			  style:UIBarButtonItemStyleBordered
																			 target:nil
																			 action:nil];
	[self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{UITextAttributeFont:[FontAwesomeKit fontWithSize:20]}
										 forState:UIControlStateNormal];
	
	
	// using Font-Awesome on UILabel
	self.facebookLabel.text = FAKIconFacebookSign;
	self.facebookLabel.font = [FontAwesomeKit fontWithSize:45];
	self.facebookLabel.textColor = [UIColor colorWithRed:0.231 green:0.349 blue:0.596 alpha:1.000];
	
	// using Font-Awesome on UIButton
	[self.twitterButton setTitle:FAKIconTwitter forState:UIControlStateNormal];
	[self.twitterButton setTitleColor:[UIColor colorWithRed:0.000 green:0.675 blue:0.933 alpha:1.000] forState:UIControlStateNormal];
	self.twitterButton.titleLabel.font = [FontAwesomeKit fontWithSize:36];
	
	
	
	//using Font-Awesome on UIImageView with shadow
	NSDictionary *shadowAttr = @{FAKShadowAttributeColor : [UIColor grayColor],
							  FAKShadowAttributeOffset : [NSValue valueWithCGSize:CGSizeMake(2, 2)],
							  FAKShadowAttributeBlur : @(2.0f)};
	NSDictionary *attr = @{FAKImageAttributeForegroundColor: [UIColor colorWithRed:208.0/255
																			 green:67.0/255
																			  blue:41.0/255
																			 alpha:1.0]
						, FAKImageAttributeShadow : shadowAttr};
	UIImage *googleplusIcon = [FontAwesomeKit imageForIcon:FAKIconGooglePlusSign
											 imageSize:CGSizeMake(45, 45)
											  fontSize:45
											attributes:attr];
	
	self.imageView.image = googleplusIcon;
	
	//using Font-Awesome on UILabel with linear gradient color
	NSArray *colors = @[(id)[UIColor colorWithHue:59.0/360 saturation:0.2 brightness:1.0 alpha:1.0].CGColor,
					 (id)[UIColor colorWithHue:59.0/360 saturation:1.0 brightness:1.0 alpha:1.0].CGColor,
					 (id)[UIColor colorWithHue:59.0/360 saturation:0.8 brightness:0.8 alpha:1.0].CGColor];
	
	NSArray *locations = @[@0.2, @0.8, @1.0];
	UIImage *gradientPattern = [FontAwesomeKit linearGradientImageWithSize:CGSizeMake(45, 45)
																	colors:colors
																 locations:locations];
	self.starLabel.text = FAKIconStar;
	self.starLabel.font = [FontAwesomeKit fontWithSize:45];
	self.starLabel.textColor = [UIColor colorWithPatternImage:gradientPattern];
	
	//using gradient pattern image as Forgeground color of an icon
	NSArray *githubColors = @[(id)[UIColor colorWithWhite:0.2 alpha:1.0].CGColor,
						   (id)[UIColor colorWithWhite:0.1 alpha:1.0].CGColor,
						   (id)[UIColor colorWithWhite:0.35 alpha:1.0].CGColor];
	
	
	NSArray *githubLocations = @[@0.2, @0.5, @1.0];
	UIImage *githubGradientPattern = [FontAwesomeKit linearGradientImageWithSize:CGSizeMake(45, 45)
																		  colors:githubColors
																	   locations:githubLocations];
	
	NSDictionary *githubAttr =@{FAKImageAttributeForegroundColor:[UIColor colorWithPatternImage:githubGradientPattern]};
	self.gradientImageView.image = [FontAwesomeKit imageForIcon:FAKIconGithub
													  imageSize:CGSizeMake(45, 45)
													   fontSize:45
													 attributes:githubAttr];
	
	//using Font-Awesome on UILabel with radial gradient color
	colors = @[(id)[UIColor colorWithHue:111.0/360 saturation:1.0 brightness:1.0 alpha:1.0].CGColor,
			(id)[UIColor colorWithHue:111.0/360 saturation:1.0 brightness:0.7 alpha:1.0].CGColor];
	
	CGPoint centerPoint = CGPointMake(45.0/2 - 5, 45.0/2);
	gradientPattern = [FontAwesomeKit radialGradientImageWithSize:CGSizeMake(45, 45)
														   colors:colors
														locations:locations
													  startCenter:centerPoint
													  startRadius:1.0
														endCenter:centerPoint
														endRadius:27];
	self.okLabel.text = FAKIconOkSign;
	self.okLabel.font = [FontAwesomeKit fontWithSize:45];
	self.okLabel.textColor= [UIColor colorWithPatternImage:gradientPattern];
	
	// using Font-Awesome on UISegmentControl in Toolbar
	UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[FAKIconArrowLeft, FAKIconArrowRight]];
	
	[segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
	[segmentControl setTitleTextAttributes:@{UITextAttributeFont:[FontAwesomeKit fontWithSize:24]}
									   forState:UIControlStateNormal];
	
	self.toolbar.items = @[[[UIBarButtonItem alloc] initWithCustomView:segmentControl]];
}

- (void)viewDidUnload {
	[self setStarLabel:nil];
	[self setOkLabel:nil];
	[self setGradientImageView:nil];
	[super viewDidUnload];
}
@end
