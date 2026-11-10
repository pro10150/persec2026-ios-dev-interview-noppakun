import Testing
@testable import PositiveIntSort

@Suite("Positive Int Sort Test Suite")
struct PositiveIntSortTests {
	@Test(
		"Test sorted positive int",
		arguments: [
			(3008, 8300),
			(1989, 9981),
			(2679, 9762),
			(9163, 9631),
			(5498498498, 9998885444),
			(0, 0),
			(04, 4),
			(15, 51)
		]
	)
	func sortedPositiveIntTest(value: Int, expected: Int) throws {
		#expect(try sortPositiveInt(value: value) == expected)
	}
	
	@Test(
		"Test Positive Int Error Handling",
		arguments: [
			-1,
			-500,
			 -6989847,
			 9223372036854775807 // Overflow
		]
	)
	func positiveIntErrorTest(value: Int) {
		#expect(throws: SortPositiveError.self) {
			try sortPositiveInt(value: value)
		}
	}
}
