#import "CallTracer.h"
#import "NSLogger/LoggerClient.h"


@interface SQLiteStorage : NSObject {

}

+ (void) setupLogger;
- (SQLiteStorage *)initWithDefaultDBFilePathAndLogToConsole: (BOOL) shouldLog;
- (SQLiteStorage *)initWithDBFilePath:(NSString *) DBFilePath andLogToConsole: (BOOL) shouldLog;
- (BOOL)saveTracedCall: (CallTracer*) tracedCall;


@end

