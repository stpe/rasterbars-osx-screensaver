#import "Wave.h"

@implementation Wave

float t;

- (id) initWithSize:(NSSize)size {
    self = [super initWithSize:size];
    if (self) {
        int barCount = 20;
        
        bars = [NSMutableArray arrayWithCapacity:barCount];
        
        float step = M_PI * 2 / 25;

        for (int i = 0; i < barCount; i++) {
            [bars addObject:[Rasterbar rasterbarWithStep:step
                                                    size:10
                                                   speed:0.00
                                              screenSize:size
                                                   color:[NSColor colorWithCalibratedHue:(i / (float) (barCount-1))
                                                                              saturation:1.0
                                                                              brightness:1.0
                                                                                   alpha:1.0]
                             ]];
        }
        
        t = 0.0;
    }
    return self;
}

- (void) draw {
    [self clearScreen];
    
    t += 0.05;
    if (t > M_PI * 2) {
        t = 0.0;
    }
    
    float halfHeight = _size.height / 2.0;
    int i = 0;
    for (Rasterbar *bar in bars) {
        float sinValue = t + i*0.1 + M_PI * 2 / [bars count ];
        float position = sinf(sinValue);
        
        int y = halfHeight + round(halfHeight / 1.5 * position);
        [bar draw:y];
        i++;
    }
}

@end
