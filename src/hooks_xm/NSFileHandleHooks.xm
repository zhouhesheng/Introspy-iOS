/*
We're directly including this file into Tweak.xmi at build time.
Tweak.xmi includes/defines the following things:

#import "CallTracer.h"
#import "IntrospySQLiteStorage.h"
IntrospySQLiteStorage *traceStorage;
*/


%hook NSFileHandle


+ (id)fileHandleForReadingAtPath:(NSString *)path {
	id origResult = %orig(path);
	CallTracer *tracer = [[CallTracer alloc] initWithClass:@"NSFileHandle" andMethod:@"fileHandleForReadingAtPath:"];
	[tracer addArgFromPlistObject:path withKey:@"path"];
	// Only store the value of the pointer for now. TODO: Convert NSFilehandle to Plist object
	// TODO: what do you want to parse what out of it? i.e., do you want to
	// actually make instance calls to the filehandle? to e.g., get the
	// data? [NSFileHandle readDataToEndOfFile]?
	[tracer addReturnValueFromPlistObject: objectTypeNotSupported];
	[traceStorage saveTracedCall: tracer];
	[tracer release];
	return origResult;
}

+ (id)fileHandleForReadingFromURL:(NSURL *)url error:(NSError **)error {
	id origResult = %orig(url, error);
	CallTracer *tracer = [[CallTracer alloc] initWithClass:@"NSFileHandle" andMethod:@"fileHandleForReadingFromURL:error:"];
	[tracer addArgFromPlistObject:[PlistObjectConverter convertURL: url] withKey:@"url"];
	[tracer addArgFromPlistObject:objectTypeNotSupported withKey:@"error"];
	[tracer addReturnValueFromPlistObject:objectTypeNotSupported];
	[traceStorage saveTracedCall: tracer];
	[tracer release];
	return origResult;
}

+ (id)fileHandleForUpdatingAtPath:(NSString *)path {
	id origResult = %orig(path);
	CallTracer *tracer = [[CallTracer alloc] initWithClass:@"NSFileHandle" andMethod:@"fileHandleForUpdatingAtPath:"];
	[tracer addArgFromPlistObject:path withKey:@"path"];
	[tracer addReturnValueFromPlistObject: objectTypeNotSupported];
	[traceStorage saveTracedCall: tracer];
	[tracer release];
	return origResult;
}

+ (id)fileHandleForUpdatingURL:(NSURL *)url error:(NSError **)error {
	id origResult = %orig(url, error);
	CallTracer *tracer = [[CallTracer alloc] initWithClass:@"NSFileHandle" andMethod:@"fileHandleForUpdatingURL:error:"];
	[tracer addArgFromPlistObject:[PlistObjectConverter convertURL: url] withKey:@"url"];
	[tracer addArgFromPlistObject:objectTypeNotSupported withKey:@"error"];
	[tracer addReturnValueFromPlistObject:objectTypeNotSupported];
	[traceStorage saveTracedCall: tracer];
	[tracer release];
	return origResult;
}

+ (id)fileHandleForWritingAtPath:(NSString *)path {
	id origResult = %orig(path);
	CallTracer *tracer = [[CallTracer alloc] initWithClass:@"NSFileHandle" andMethod:@"fileHandleForWritingAtPath:"];
	[tracer addArgFromPlistObject:path withKey:@"path"];
	[tracer addReturnValueFromPlistObject: objectTypeNotSupported];
	[traceStorage saveTracedCall: tracer];
	[tracer release];
	return origResult;
}

+ (id)fileHandleForWritingToURL:(NSURL *)url error:(NSError **)error {
	id origResult = %orig(url, error);
	CallTracer *tracer = [[CallTracer alloc] initWithClass:@"NSFileHandle" andMethod:@"fileHandleForWritingToURL:error:"];
	[tracer addArgFromPlistObject:[PlistObjectConverter convertURL: url] withKey:@"url"];
	[tracer addArgFromPlistObject:objectTypeNotSupported withKey:@"error"];
	[tracer addReturnValueFromPlistObject:objectTypeNotSupported];
	[traceStorage saveTracedCall: tracer];
	[tracer release];
	return origResult;
}

%end

/* vim: set filetype=objc : */
