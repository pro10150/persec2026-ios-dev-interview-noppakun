import Testing

@testable import Tribonacci

@Suite("Tribonacci Test Suite")
struct TribonacciTests {
	@Test(
		"Test get Tribonacci result",
		arguments: [
			([1, 3, 5], 5, [1, 3, 5, 9, 17]),
			([2, 2, 2], 3, [2, 2, 2]),
			([10, 10, 10], 4, [10, 10, 10, 30]),
			([2, 2, 2], 2, [2, 2]),
			([2, 2, 2], 1, [2]),
			([1, 2, 3], 0, []),
			([0, 1, 1], 10, [0, 1, 1, 2, 4, 7, 13, 24, 44, 81]),
			([-1, -2, -3], 5, [-1, -2, -3, -6, -11]),
			([0, 0, 0], 5, [0, 0, 0, 0, 0]),
			([0, 0], 3, [0, 0, 1]),
			([0, 0], 4, [0, 0, 1, 1]),
			([0, 0], 5, [0, 0, 1, 1, 2])
		]
	)
	func getTribonaccitTest(items: [Int], maxResult: Int, expected: [Int]) throws {
		#expect(try getTribonacci(items: items, maxResult: maxResult) == expected)
	}
	
	@Test(
		"Test Tribonacci maxResult parameter error",
		arguments: [
			-1,
			-554,
			-7_897_987,
		]
	)
	func maxResultParameterErrorTest(maxResult: Int) {
		#expect(throws: TribonacciError.negativeMaxResult.self) {
			try getTribonacci(items: [], maxResult: maxResult)
		}
	}
	
	@Test(
		"Test Tribonacci items overflow error",
		arguments: [
			[1, 2, 3, 4],
			[1, 2, 3, 4, 5],
			[1, 2, 3, 3, 3, 3]
		]
	)
	func itemOverflowErrorTest(items: [Int]) {
		#expect(throws: TribonacciError.itemOverflow) {
			try getTribonacci(items: items, maxResult: 10)
		}
	}
	
	@Test(
		"Test Seed",
		arguments: [
			([], [0, 1, 1]),
			([1], [1, 1, 1]),
			([3, 2], [3, 2, 1]),
			([5, 3, 2], [5, 3, 2])
		]
	)
	func getSeedTest(items: [Int], expected: [Int]) throws {
		#expect(try getSeed(items: items) == expected)
	}
}
