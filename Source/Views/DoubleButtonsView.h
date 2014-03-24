//
//  DoubleButtonsView.h
//  AutoLayoutSample
//
//  Created by Rafał Kitta on 3/24/14.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleButtonsView : UIView

/**
 *  Setter of colors property of both buttons.
 *
 *  @param firstColor  Background color of first(top) button.
 *  @param secondColor Background color of second(bottom) button.
 */
- (void)setFirstButtonsColor:(UIColor *)firstColor
          secondButtonsColor:(UIColor *)secondColor;

@end
