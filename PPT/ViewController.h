//
//  ViewController.h
//  PPT
//
//  Created by Andrew Rauh on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseSlides.h"

@interface ViewController : UIViewController {
    ParseSlides *parse;
    
}

@property (nonatomic, strong) ParseSlides *parse;
@end
