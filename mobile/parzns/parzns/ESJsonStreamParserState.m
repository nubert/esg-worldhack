/*
 Copyright (c) 2010, Stig Brautaset.
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

   Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

   Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

   Neither the name of the the author nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ESJsonStreamParserState.h"
#import "ESJsonStreamParser.h"

#define SINGLETON \
+ (id)sharedInstance { \
    static id state; \
    if (!state) state = [[self alloc] init]; \
    return state; \
}

@implementation ESJsonStreamParserState

+ (id)sharedInstance { return nil; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	return NO;
}

- (ESJsonStreamParserStatus)parserShouldReturn:(ESJsonStreamParser*)parser {
	return ESJsonStreamParserWaitingForData;
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {}

- (BOOL)needKey {
	return NO;
}

- (NSString*)name {
	return @"<aaiie!>";
}

- (BOOL)isError {
    return NO;
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateStart

SINGLETON

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	return token == ESJson_token_array_start || token == ESJson_token_object_start;
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {

	ESJsonStreamParserState *state = nil;
	switch (tok) {
		case ESJson_token_array_start:
			state = [ESJsonStreamParserStateArrayStart sharedInstance];
			break;

		case ESJson_token_object_start:
			state = [ESJsonStreamParserStateObjectStart sharedInstance];
			break;

		case ESJson_token_array_end:
		case ESJson_token_object_end:
			if (parser.supportMultipleDocuments)
				state = parser.state;
			else
				state = [ESJsonStreamParserStateComplete sharedInstance];
			break;

		case ESJson_token_eof:
			return;

		default:
			state = [ESJsonStreamParserStateError sharedInstance];
			break;
	}


	parser.state = state;
}

- (NSString*)name { return @"before outer-most array or object"; }

@end

#pragma mark -

@implementation ESJsonStreamParserStateComplete

SINGLETON

- (NSString*)name { return @"after outer-most array or object"; }

- (ESJsonStreamParserStatus)parserShouldReturn:(ESJsonStreamParser*)parser {
	return ESJsonStreamParserComplete;
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateError

SINGLETON

- (NSString*)name { return @"in error"; }

- (ESJsonStreamParserStatus)parserShouldReturn:(ESJsonStreamParser*)parser {
	return ESJsonStreamParserError;
}

- (BOOL)isError {
    return YES;
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateObjectStart

SINGLETON

- (NSString*)name { return @"at beginning of object"; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	switch (token) {
		case ESJson_token_object_end:
		case ESJson_token_string:
			return YES;
			break;
		default:
			return NO;
			break;
	}
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateObjectGotKey sharedInstance];
}

- (BOOL)needKey {
	return YES;
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateObjectGotKey

SINGLETON

- (NSString*)name { return @"after object key"; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	return token == ESJson_token_keyval_separator;
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateObjectSeparator sharedInstance];
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateObjectSeparator

SINGLETON

- (NSString*)name { return @"as object value"; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	switch (token) {
		case ESJson_token_object_start:
		case ESJson_token_array_start:
		case ESJson_token_true:
		case ESJson_token_false:
		case ESJson_token_null:
		case ESJson_token_number:
		case ESJson_token_string:
			return YES;
			break;

		default:
			return NO;
			break;
	}
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateObjectGotValue sharedInstance];
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateObjectGotValue

SINGLETON

- (NSString*)name { return @"after object value"; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	switch (token) {
		case ESJson_token_object_end:
		case ESJson_token_separator:
			return YES;
			break;
		default:
			return NO;
			break;
	}
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateObjectNeedKey sharedInstance];
}


@end

#pragma mark -

@implementation ESJsonStreamParserStateObjectNeedKey

SINGLETON

- (NSString*)name { return @"in place of object key"; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
    return ESJson_token_string == token;
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateObjectGotKey sharedInstance];
}

- (BOOL)needKey {
	return YES;
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateArrayStart

SINGLETON

- (NSString*)name { return @"at array start"; }

- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	switch (token) {
		case ESJson_token_object_end:
		case ESJson_token_keyval_separator:
		case ESJson_token_separator:
			return NO;
			break;

		default:
			return YES;
			break;
	}
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateArrayGotValue sharedInstance];
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateArrayGotValue

SINGLETON

- (NSString*)name { return @"after array value"; }


- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	return token == ESJson_token_array_end || token == ESJson_token_separator;
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	if (tok == ESJson_token_separator)
		parser.state = [ESJsonStreamParserStateArrayNeedValue sharedInstance];
}

@end

#pragma mark -

@implementation ESJsonStreamParserStateArrayNeedValue

SINGLETON

- (NSString*)name { return @"as array value"; }


- (BOOL)parser:(ESJsonStreamParser*)parser shouldAcceptToken:(ESJson_token_t)token {
	switch (token) {
		case ESJson_token_array_end:
		case ESJson_token_keyval_separator:
		case ESJson_token_object_end:
		case ESJson_token_separator:
			return NO;
			break;

		default:
			return YES;
			break;
	}
}

- (void)parser:(ESJsonStreamParser*)parser shouldTransitionTo:(ESJson_token_t)tok {
	parser.state = [ESJsonStreamParserStateArrayGotValue sharedInstance];
}

@end

