import Testing
@testable import AutoComplete

@Suite("Autocomplete Test")
struct AutoCompleteTests {
	@Test(
		"Testing Autocomplete function",
		arguments: [
			("th", ["Mother", "Think", "Worthy", "Apple", "Android"], 2, ["Think", "Mother"]),
			("th", ["Mother", "Apple", "Android"], 2, ["Mother"]),
			("th", ["Mother", "Apple", "Android"], 1, ["Mother"]),
			("th", ["Mother", "Think", "Worthy", "Apple", "Android"], 3, ["Think", "Mother", "Worthy"]),
			("th", ["tth", "thth"], 2, ["thth", "tth"]),
			("th", ["Think"], 0, []),                       // max 0
			("th", ["Think"], -1, []),                      // negative → crash risk
			("th", ["Think", "Mother"], 10, ["Think", "Mother"]), // max > count
			("th", [], 3, []),                              // empty items
			("", ["a", "b"], 2, []),                       // empty search
			("thinking", ["th"], 1, []),                    // search longer than item
			("th", ["th"], 1, ["th"]),                      // exact match
			("TH", ["think"], 1, ["think"]),                // uppercase search
			("th", ["this", "that"], 2, ["that", "this"]),  // same position → alpha
			("th", ["thb", "Tha"], 2, ["Tha", "thb"]),                 // tie + mixed case: "T" < "t" in ASCII
			("th", ["Tha", "thb"], 2, ["Tha", "thb"]),
			("th", ["Think", "Think"], 2, ["Think", "Think"]), // duplicates: keep or dedupe?
			(" th", ["a th"], 1, ["a th"]),                 // whitespace
			("ไท", ["คนไทย", "ไทย"], 2, ["ไทย", "คนไทย"]),   // Thai / unicode
			("é", ["café", "cafe"], 1, ["café"]),           // diacritics: match "e"?
		]
	)
	func autocompleteTest(search: String, items: [String], maxResult: Int, expected: [String]) {
		#expect(autocomplete(search: search, items: items, maxResult: maxResult) == expected)
	}
	
	@Test(
		"Testing Search",
		arguments: [
			("th", [], []),
			("th", ["TH", "MOTHER", "mother"], ["TH", "MOTHER", "mother"]),
			("th", ["Mother", "Think", "Worthy", "Apple", "Android"], ["Mother", "Think", "Worthy"]),
			("", ["Mother", "Think", "Worthy", "Apple", "Android"], []),
			("t", ["1t", "1T", "1t", "2t", "tt", "d"], ["1t", "1T", "1t", "2t", "tt"]),
			("th", ["Apple", "Android"], [])
		]
	)
	func searchListTest(keyword: String, items: [String], expected: [String]) {
		#expect(searchList(keyword: keyword, items: items) == expected)
	}
	
	@Test(
		"Testing Sort",
		arguments: [
			("th", ["Mother", "Think", "Worthy"], ["Think", "Mother", "Worthy"]),
			("th", [], []),
			("th", ["mother"], ["mother"]),
			("th", ["mortar", "mother"], ["mother", "mortar"]),
			("th", ["think", "think", "thought"], ["think", "think", "thought"]),
			("th", ["Think", "Mother", "Worthy"], ["Think", "Mother", "Worthy"]),
			("th", ["Worthy", "Mother", "Think"], ["Think", "Mother", "Worthy"]),
			("th", ["Worthy", "worthy"], ["Worthy", "worthy"]),
			("th", ["worthy", "Worthy"], ["Worthy", "worthy"])
		]
	)
	func sortItemsTest(keyword: String, items: [String], expected: [String]) {
		#expect(sortItems(keyword: keyword, items: items) == expected)
	}
}
