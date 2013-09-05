//
//  RootViewController.h
//  LOL
//
//  Created by MagicStudio on 12-9-15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController<UIViewControllerRestoration>
{
    NSMutableArray *heroData;
    NSMutableArray *heroSections;
    NSTimer* timer_;
    UIImage * image_;

}

- (void) createHeroData;
-(id)initWithImage:(UIImage * )image;

@end
