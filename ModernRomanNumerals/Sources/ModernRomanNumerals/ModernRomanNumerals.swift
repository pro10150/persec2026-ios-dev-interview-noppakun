let values: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
let romanTable: [(Int, String)] = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

public func convertToRomanNumerals(from number: Int) throws -> String {
	var numbleVariable = number
	var romanNumerals = ""
	guard number > 0 && number < 4000 else { throw RomanNumeralsError.invalidNumber }
	for romanConversion in romanTable {
		let romanCount = numbleVariable  / romanConversion.0
		guard romanCount > 0 else { continue }
		let romanNumeral = String(repeating: romanConversion.1, count: romanCount)
		romanNumerals.append(romanNumeral)
		numbleVariable -= romanConversion.0 * romanCount
	}
	return romanNumerals
}

public func convertFromRomanNumerals(from romanNumerals: String) throws -> Int {
	let pattern = /^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
	guard !romanNumerals.isEmpty,
		  romanNumerals.wholeMatch(of: pattern) != nil
	else { throw RomanNumeralsError.invalidRomanNumerals }
	var total = 0, previous = 0
	for char in romanNumerals.reversed() {
		let value = values[char]!
		total += value < previous ? -value : value
		previous = value
	}
	return total
}

enum RomanNumeralsError: Error {
	case invalidNumber
	case invalidRomanNumerals
}
