#import <Foundation/Foundation.h>
#import <ScreenSaver/ScreenSaver.h>
#import "Rasterbar.h"

@interface Effect : NSObject {
    NSSize _size;
    NSMutableArray *bars;
}

- (id) initWithSize:(NSSize)size;
+ (id) effectWithSize:(NSSize)size;
- (void) clearScreen;
- (void) draw;

@end
