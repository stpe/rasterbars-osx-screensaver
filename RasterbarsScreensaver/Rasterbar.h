#import <Foundation/Foundation.h>
#import <ScreenSaver/ScreenSaver.h>
#include <math.h>

@interface Rasterbar : NSObject {
    float _step;
    float _size;
    float _speed;
    float _offset;
    NSSize _screenSize;
    NSColor* _color;
}

- (id) initWithStep:(float)step size:(float)size speed:(float)speed screenSize:(NSSize)screenSize color:(NSColor*)color;
+ (id) rasterbarWithStep:(float)step size:(float)size speed:(float)speed screenSize:(NSSize)screenSize color:(NSColor*)color;
- (void) draw:(int)position;
    
@end
