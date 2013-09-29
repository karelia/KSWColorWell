//
//  KSWColorWell.h
//
//  Created by Mike on 28/09/2013.
//  Copyright (c) 2013 Karelia Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSWColorWell : UIView

/**
 The color to display.
 
 If `nil`, the receiver performs no drawing of its own (i.e. it's invisible
 unless you provide a background color or similar).
 
 Defaults to `nil`.
 */
@property(nonatomic, copy) UIColor *color;

@end
