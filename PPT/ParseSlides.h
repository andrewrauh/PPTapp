//
//  ParseSlides.h
//  PPT
//
//  Created by Andrew Rauh on 2/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"
#import "ZipArchive.h"

@interface ParseSlides : NSObject {

    //NSMutableDictionary *Slides;
    ZipArchive *zipArchive;


}

-(void)parseBulletsandReturnDictionaryforSlide;
-(void)unZipPowerPoint:(NSString *)zipPath;

//-(NSMutableDictionary *) buildSlidesDictionary;
@property (nonatomic, strong) ZipArchive *zipArchive;




@end
