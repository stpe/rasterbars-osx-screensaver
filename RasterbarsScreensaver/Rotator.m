#import "Rotator.h"

@implementation Rotator

float t;

- (id) initWithSize:(NSSize)size {
    self = [super initWithSize:size];
    if (self) {
        bars = [NSMutableArray arrayWithCapacity:3];
        
        float step = M_PI * 2 / 25;
        
        [bars addObject:[Rasterbar rasterbarWithStep:step
                                                size:50
                                               speed:0.02
                                          screenSize:size
                                               color:[NSColor colorWithCalibratedRed:255.0 / 255.0
                                                                               green:255.0 / 255.0
                                                                                blue:32.0 / 255.0
                                                                               alpha:1.0]]];
        
        [bars addObject:[Rasterbar rasterbarWithStep:step
                                                size:50
                                               speed:0.02
                                          screenSize:size
                                               color:[NSColor colorWithCalibratedRed:255.0 / 255.0
                                                                               green:32.0 / 255.0
                                                                                blue:255.0 / 255.0
                                                                               alpha:1.0]]];
        
        [bars addObject:[Rasterbar rasterbarWithStep:step
                                                size:50
                                               speed:0.02
                                          screenSize:size
                                               color:[NSColor colorWithCalibratedRed:32.0 / 255.0
                                                                               green:255.0 / 255.0
                                                                                blue:255.0 / 255.0
                                                                               alpha:1.0]]];

        t = 0.0;
    }
    return self;
}

- (void) draw {
    [self clearScreen];
    
    float halfHeight = _size.height / 2.0;
    
    t += 0.05;
    if (t > M_PI * 2) {
        t = 0.0;
    }

    // do two pass, draw bar going one direction over
    // those in the other direction to get a sense of depth
    int pass = 2;
    while (pass) {
        int i = 0;
        for (Rasterbar *bar in bars) {
            float sinValue = t + i * M_PI * 2 / [bars count ];
            float position = sinf(sinValue);
            float drawPosition = sinf(sinValue - M_PI_2);
            
            int y = halfHeight + round(halfHeight / 3.5 * position);
            if (pass == 2 && drawPosition < 0) {
                [bar draw:y];
            } else if (pass == 1 && drawPosition >= 0) {
                [bar draw:y];
            }
            
            i++;
        }
        pass--;
    }
}

@end
