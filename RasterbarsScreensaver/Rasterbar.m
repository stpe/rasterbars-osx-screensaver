#import "Rasterbar.h"

@implementation Rasterbar

// how quickly should color fade to black the further out on the bar it is (<0: darker, >0: brighter)
const float COLOR_CUTOFF = 1.125;

- (id) initWithStep:(float)step size:(float)size speed:(float)speed screenSize:(NSSize)screenSize color:(NSColor*)color {
    self = [super init];
    if (self) {
        _step = step;
        _size = size;
        _speed = speed;
        _offset = 0.0;
        _color = color;
        
        _screenSize = screenSize;
    }
    return self;
}

+ (id) rasterbarWithStep:(float)step size:(float)size speed:(float)speed screenSize:(NSSize)screenSize color:(NSColor*)color {
    return [[Rasterbar alloc] initWithStep:step size:size speed:speed screenSize:screenSize color:color];
}

- (void) draw:(int)position {
    NSRect rect;
    
    _offset = _offset + _speed;
    if (_offset > _step) {
        _offset = 0;
    }
    
    int prevY = 0;
    float t = _offset;
    
    while (t < M_PI + _offset) {
        // vertical position
        int y = round(_size * sinf(3 * M_PI_2 + t)) + _size;
        int height = y - prevY;
        
        // color
        float f = fabsf((y - _size) / (_size * COLOR_CUTOFF));
        [[_color shadowWithLevel:f] set];

        // draw
        rect.size = NSMakeSize(_screenSize.width, height);
        rect.origin = CGPointMake(0, prevY + position);
        NSRectFill(rect);
        
        t = t + _step;
        prevY = y;
    }
}

@end
