# Prompt ที่ใช้งาน
## ข้อ 1
### 1 - เขียน Regex
give me the regex for swift function to check if the string only contains parentheses, brackets, curly braces
## ข้อ 2
### 1 - เขียน Unit Test
```swift 
// Assumption: ค่า Country Code เป็น 2 หลักเสมอ
public func sortServer(list: [String]) -> [String] {
	return list.sorted { initial, next in
		let (initialCode, initialNum) = sortKey(initial), (nextCode, nextNum) = sortKey(next)
		return (initialCode, initialNum, initial) < (nextCode, nextNum, next)
	}
}

func sortKey(_ s: String, prefixCount: Int = 2) -> (String, Int) {
	let countryCode = String(s.prefix(prefixCount))
	let serverNum = Int(s.dropFirst(prefixCount).prefix(while: \.isNumber)) ?? .max
	return (countryCode, serverNum)
}
```
what are the edge cases that should be tested in unit test?

## ข้อ 3
### 1 - เขียน Unit Test
```
@Suite("Autocomplete Test")
struct AutoCompleteTests {
	@Test(
		"Testing Autocomplete function",
		arguments: [
			("th", ["Mother", "Think", "Worthy", "Apple", "Android"], 2, ["Think", "Mother"]),
			("th", ["Mother", "Apple", "Android"], 2, ["Mother"]),
			("th", ["Mother", "Apple", "Android"], 1, ["Mother"]),
			("th", ["Mother", "Think", "Worthy", "Apple", "Android"], 3, ["Think", "Mother", "Worthy"]),
			("th", ["tth", "thth"], 2, ["thth", "tth"])
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
			("th", ["Mother", "Think", "Worthy", "Apple", "Android"], ["Mother", "Think", "Worthy"])
		]
	)
	func searchListTest(keyword: String, items: [String], expected: [String]) {
		#expect(searchList(keyword: keyword, items: items) == expected)
	}

	@Test(
		"Testing Sort",
		arguments: [
			("th", ["Mother", "Think", "Worthy"], ["Think", "Mother", "Worthy"])
		]
	)
	func sortItemsTest(keyword: String, items: [String], expected: [String]) {
		#expect(sortItems(keyword: keyword, items: items) == expected)
	}
}
```

Think of edge cases to test these functions?

### 2 - ถามต่อยอดจากข้อ 1
About this test("" keyword), should this function's test still guard the empty search still? There'd be a guard inside the autocomplete function, so there's little chance it'd get past that. Except for the case that this function is reused elsewhere. The function internal, so it can be used inside the package.