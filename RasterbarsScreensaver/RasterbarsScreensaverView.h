#import <ScreenSaver/ScreenSaver.h>
#import "Rasterbar.h"
#import "Effect.h"
#import "Rotator.h"
#import "Wave.h"

@interface RasterbarsScreensaverView : ScreenSaverView {
    Effect *effect;
    NSArray *effects;
    NSEnumerator *effectsEnum;
}

- (void)nextEffectTimerMethod:(NSTimer*)timer;

@end
