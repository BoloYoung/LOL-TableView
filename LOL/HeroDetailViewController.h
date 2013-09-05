//
//  HeroDetailViewController.h
//  LOL
//
//  Created by MagicStudio on 12-9-15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailViewController : UIViewController
{
    IBOutlet UIWebView *detailWebView;
    NSURL *detailURL;
}

@property (nonatomic, retain) NSURL *detailURL;
@property (nonatomic, retain) UIWebView *detailWebView;

@end
