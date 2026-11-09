import Testing
@testable import StringSortTest

@Suite("String Sort Test")
struct StringSortTestTests {
	@Test(
		"Testing String Sort",
		arguments: [
			(["TH19", "SG20", "TH2"], ["SG20", "TH2", "TH19"]),
			(["TH10", "TH3Netflix", "TH1", "TH7"], ["TH1", "TH3Netflix", "TH7", "TH10"]),
			(["TH3Netflix", "TH3"], ["TH3", "TH3Netflix"]),
			(["SG20", "TH2", "TH19"], ["SG20", "TH2", "TH19"]),
			([], []),
			(["TH1", "TH1"], ["TH1", "TH1"]),
			(["THNetflix", "TH1"], ["TH1", "THNetflix"]),
			(["T", ""], ["", "T"])
		]
	)
	func sortServerTest(list: [String], expected: [String]) {
		#expect(sortServer(list: list) == expected)
	}
	
	@Test(
		"Testing separating country code from number",
		arguments: [
			("TH19", ("TH", 19)),
			("SG20", ("SG", 20)),
			("TH2", ("TH", 2)),
			("TH19", ("TH", 19)),
			("SG12", ("SG", 12)),
			("TH3Netflix", ("TH", 3)),
			("US1", ("US", 1)),
			("US12", ("US", 12)),
			("US3", ("US", 3)),
			("US5", ("US", 5))
		]
	)
	func sortKeyTest(key: String, expected: (String, Int)) {
		#expect(sortKey(key) == expected)
	}
}
