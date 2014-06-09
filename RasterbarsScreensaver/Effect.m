#import "Effect.h"

@implementation Effect

- (id) initWithSize:(NSSize)size {
    self = [super init];
    if (self) {
        _size = size;
    }
    return self;
}

+ (id) effectWithSize:(NSSize)size {
    return [[self alloc] initWithSize:size];
}

- (void) clearScreen {
    [[NSColor blackColor] set];
    NSRect fullScreen;
    fullScreen = NSMakeRect(0, 0, _size.width, _size.height);
    NSRectFill(fullScreen);
}

- (void) draw {
    [self clearScreen];
}


@end
