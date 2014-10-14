/**
 * This file is part of Todo.txt, an iOS app for managing your todo.txt file.
 *
 * @author Todo.txt contributors <todotxt@yahoogroups.com>
 * @copyright 2011-2013 Todo.txt contributors (http://todotxt.com)
 *  
 * Dual-licensed under the GNU General Public License and the MIT License
 *
 * @license GNU General Public License http://www.gnu.org/licenses/gpl.html
 *
 * Todo.txt is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any
 * later version.
 *
 * Todo.txt is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with Todo.txt.  If not, see
 * <http://www.gnu.org/licenses/>.
 *
 *
 * @license The MIT License http://www.opensource.org/licenses/mit-license.php
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "SortTest.h"
#import "Task.h"
#import "Sort.h"


@implementation SortTest



- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
	unsortedTasks = [[NSArray arrayWithObjects:
					 [[[Task alloc] initWithId:1 withRawText:@"(E) a test task"] autorelease],
					 [[[Task alloc] initWithId:55 withRawText:@"z ultimate task"] autorelease],
					 [[[Task alloc] initWithId:99 withRawText:@"(A) awesome task"] autorelease],
					 [[[Task alloc] initWithId:5 withRawText:@"A capitalized task"] autorelease],
					 [[[Task alloc] initWithId:9999 withRawText:@"x a completed task"] autorelease],
					  nil] retain];
}

- (void)tearDown
{
    // Tear-down code here.
	[unsortedTasks release];
    
    [super tearDown];
}

- (void)testSort_priority
{
	Sort *sort = [Sort byName:SortPriority];
	NSArray *sortedTasks = [unsortedTasks sortedArrayUsingSelector:sort.comparator];
	
	XCTAssertEqual(99U, [[sortedTasks objectAtIndex:0] taskId], @"item out of order");
	XCTAssertEqual(1U, [[sortedTasks objectAtIndex:1] taskId], @"item out of order");
	XCTAssertEqual(5U, [[sortedTasks objectAtIndex:2] taskId], @"item out of order");
	XCTAssertEqual(55U, [[sortedTasks objectAtIndex:3] taskId], @"item out of order");
	XCTAssertEqual(9999U, [[sortedTasks objectAtIndex:4] taskId], @"item out of order");
}

- (void)testSort_idDescending
{
	Sort *sort = [Sort byName:SortIdDescending];
	NSArray *sortedTasks = [unsortedTasks sortedArrayUsingSelector:sort.comparator];
	
	XCTAssertEqual(9999U, [[sortedTasks objectAtIndex:0] taskId], @"item out of order");
	XCTAssertEqual(99U, [[sortedTasks objectAtIndex:1] taskId], @"item out of order");
	XCTAssertEqual(55U, [[sortedTasks objectAtIndex:2] taskId], @"item out of order");
	XCTAssertEqual(5U, [[sortedTasks objectAtIndex:3] taskId], @"item out of order");
	XCTAssertEqual(1U, [[sortedTasks objectAtIndex:4] taskId], @"item out of order");
}

- (void)testSort_idAscending
{
	Sort *sort = [Sort byName:SortIdAscending];
	NSArray *sortedTasks = [unsortedTasks sortedArrayUsingSelector:sort.comparator];
	
	XCTAssertEqual(1U, [[sortedTasks objectAtIndex:0] taskId], @"item out of order");
	XCTAssertEqual(5U, [[sortedTasks objectAtIndex:1] taskId], @"item out of order");
	XCTAssertEqual(55U, [[sortedTasks objectAtIndex:2] taskId], @"item out of order");
	XCTAssertEqual(99U, [[sortedTasks objectAtIndex:3] taskId], @"item out of order");
	XCTAssertEqual(9999U, [[sortedTasks objectAtIndex:4] taskId], @"item out of order");
}

- (void)testSort_textAscending
{
	Sort *sort = [Sort byName:SortTextAscending];
	NSArray *sortedTasks = [unsortedTasks sortedArrayUsingSelector:sort.comparator];
	
	XCTAssertEqual(5U, [[sortedTasks objectAtIndex:0] taskId], @"item out of order");
	XCTAssertEqual(1U, [[sortedTasks objectAtIndex:1] taskId], @"item out of order");
	XCTAssertEqual(99U, [[sortedTasks objectAtIndex:2] taskId], @"item out of order");
	XCTAssertEqual(55U, [[sortedTasks objectAtIndex:3] taskId], @"item out of order");
	XCTAssertEqual(9999U, [[sortedTasks objectAtIndex:4] taskId], @"item out of order");
}

@end
