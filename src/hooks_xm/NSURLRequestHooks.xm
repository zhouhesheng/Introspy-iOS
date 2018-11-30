#import "NSLogger/LoggerClient.h"

void setupLogger() 
{
    static dispatch_once_t done;
    dispatch_once(&done, ^{
        LoggerSetupBonjour(NULL, NULL, (__bridge CFStringRef)(@"zhouhesheng"));
    });
}

// #define MYLog(...) { setupLogger(); LogMessageCompat(__VA_ARGS__); }
#define MYLog(FORMAT, ...) { setupLogger(); LogMessage(@"__NSURLRequest__", 0, FORMAT, ##__VA_ARGS__); NSLog(FORMAT, ##__VA_ARGS__); }


%hook NSURLRequest
- (id)initWithURL:(NSURL *)theURL {
	id result = %orig;
	MYLog(@"initWithURL %@", theURL);
	return result;
}

%end

%hook UIWebView
- (void)loadRequest:(NSURLRequest *)request {
	MYLog(@"loadRequest %@", request.URL);
	%orig;
}
%end
