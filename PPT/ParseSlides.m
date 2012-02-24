//
//  ParseSlides.m
//  PPT
//
//  Created by Andrew Rauh on 2/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParseSlides.h"

@implementation ParseSlides 
@synthesize zipArchive;
    
    




-(void) unZipPowerPoint:(NSString *)zipPath {
    
    zipPath = @"startupcrashcourse.pptx";
    zipArchive = [[ZipArchive alloc]init];
    
    //need to buid path of zip file here
    
    //need to pass in the 
    // need to build the sting that contains unzipped files
    
	//if( [zipArchive  UnzipOpenFile:@"/Volumes/data/testfolder/Archive.zip"] )
    
    if( [zipArchive  UnzipOpenFile:zipPath] )
	{
		BOOL ret = [zipArchive UnzipFileTo:@"/" overWrite:YES];
		if( NO==ret )
		{
            
            
		}
		[zipArchive UnzipCloseFile];
	}
    
    
}


-(void) parseBulletsandReturnDictionaryforSlide {
    
    NSMutableDictionary *slideContent = [[NSMutableDictionary alloc]init];
    NSString *XMLPath  = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"slide3.xml"];
    //this will need to be passed in later on
    NSData *XMLData = [NSData dataWithContentsOfFile:XMLPath];
    CXMLDocument *doc = [[CXMLDocument alloc] initWithData:XMLData options:0 error:nil];
    NSArray *nodes = NULL;
    nodes = [doc nodesForXPath:@"//p:sp" error:nil];
    
    
    
    for (CXMLElement *node in nodes) {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        int counter;
        for(counter = 0; counter < [node childCount]; counter++) {
            //  common procedure: dictionary with keys/values from XML node
            [item setObject:[[node childAtIndex:counter] stringValue] forKey:[[node childAtIndex:counter] name]];
            //NSLog(item);
        }
        
        //  and here it is - attributeForName! Simple as that.
        //[item setObject:[[node attributeForName:@""] stringValue] forKey:@"<a:t>"];  // <------ this magical arrow is pointing to the area of interest
        
        [slideContent addEntriesFromDictionary:item];
        //[item release];
    }
    
  //  return slideContent;


}
@end
