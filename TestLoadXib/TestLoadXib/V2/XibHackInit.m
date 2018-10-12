//
//  XibHackInit.m
//  TestLoadXib
//
//  Created by lunli on 2018/10/12.
//  Copyright © 2018年 lunli. All rights reserved.
//

#import "XibHackInit.h"

@implementation XibHackInit

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    static BOOL alreadyInitMark = NO;
    if(self = [super initWithCoder:aDecoder])
    {
        if(!alreadyInitMark)
        {
            NSString *className = NSStringFromClass([self class]);
            if([className containsString:@"."])
            {
                className = [[className componentsSeparatedByString:@"."] lastObject];
            }
            alreadyInitMark = YES;
            UIView *targetView = [[self class] loadFromNib:className];
            alreadyInitMark = NO;
            return (XibHackInit *)(targetView?targetView:self);
        }
    }
    return self;
}

+ (UIView *)loadFromNib:(NSString *)nibName
{
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:nibName
                                                      owner:nil
                                                    options:nil];
    UIView* nibView = (UIView*)[nibViews objectAtIndex:0];
    return nibView;
}

@end
