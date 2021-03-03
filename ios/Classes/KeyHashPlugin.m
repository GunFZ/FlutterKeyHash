#import "KeyHashPlugin.h"
#if __has_include(<key_hash/key_hash-Swift.h>)
#import <key_hash/key_hash-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "key_hash-Swift.h"
#endif

@implementation KeyHashPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKeyHashPlugin registerWithRegistrar:registrar];
}
@end
