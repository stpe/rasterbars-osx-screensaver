//
// Stefan Pettersson, @stpe, github.com/stpe
//
// Some screen saver related resources:
//   http://cocoadevcentral.com/articles/000088.php
//   https://developer.apple.com/library/mac/documentation/UserExperience/Reference/ScreenSaver/Miscellaneous/ScreenSaver_Functions/Reference/reference.html
//   https://developer.apple.com/library/mac/documentation/UserExperience/Reference/ScreenSaver/ObjC_classic/_index.html
//   http://www.mactech.com/articles/mactech/Vol.21/21.06/SaveOurScreens/index.html
//   http://www.mactech.com/articles/mactech/Vol.21/21.07/SaveOurScreens102/index.html
//
#import "RasterbarsScreensaverView.h"

@implementation RasterbarsScreensaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        NSSize size = [self bounds].size;
        
        // put available effects in an array
        effects = [NSArray arrayWithObjects:
                            [Rotator effectWithSize:size],
                            [Wave effectWithSize:size],
                            nil];
        
        // use an enumerator to cycle through them triggered by a timer
        effectsEnum = [effects objectEnumerator];

        // start with first effect
        effect = [effectsEnum nextObject];
        
        [NSTimer scheduledTimerWithTimeInterval:30.0
            target:self
            selector:@selector(nextEffectTimerMethod:)
            userInfo:nil
            repeats:YES];
    }
    return self;
}

- (void)nextEffectTimerMethod:(NSTimer*)timer {
    if (!(effect = [effectsEnum nextObject])) {
        // if array exhausted, get a new enumerator and start over
        effectsEnum = [effects objectEnumerator];
        effect = [effectsEnum nextObject];
    }
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [effect draw];
    
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
