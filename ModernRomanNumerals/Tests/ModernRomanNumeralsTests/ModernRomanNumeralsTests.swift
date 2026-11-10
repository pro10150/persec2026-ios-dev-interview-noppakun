import Testing
@testable import ModernRomanNumerals

@Suite("Modern Roman Numerals Tests")
struct ModernRomanNumeralsTests {
	@Test(
		"Test converting number to roman numerals",
		arguments: [
			(1989, "MCMLXXXIX"),
			(2000, "MM"),
			(68, "LXVIII"),
			(109, "CIX"),
			(3999, "MMMCMXCIX"),
			(1, "I"),
			(3, "III"),
			(4, "IV"),
			(5, "V"),
			(9, "IX"),
			(10, "X"),
			(14, "XIV"),
			(40, "XL"),
			(44, "XLIV"),
			(49, "XLIX"),
			(50, "L"),
			(90, "XC"),
			(99, "XCIX"),
			(400, "CD"),
			(444, "CDXLIV"),
			(500, "D"),
			(900, "CM"),
			(944, "CMXLIV"),
			(1000, "M"),
			(1994, "MCMXCIV"),
			(3888, "MMMDCCCLXXXVIII")
		]
	)
	func convertToRomanNumeralsTest(number: Int, expected: String) throws {
		#expect(try convertToRomanNumerals(from: number) == expected)
	}
	
	@Test(
		"Test converting Roman Numerals to number",
		arguments: [
			("MCMLXXXIX", 1989),
			("MM", 2000),
			("LXVIII", 68),
			("CIX", 109)
		]
	)
	func convertFromRomanNumeralsTest(romanNumerals: String, expected: Int) throws {
		#expect(try convertFromRomanNumerals(from: romanNumerals) == expected)
	}
	
	@Test(
		"Test Number Error",
		arguments: [
			0,
			-1,
			-5654,
			-99998848,
			-0,
			4000
		]
	)
	func numberErrorTest(number: Int) {
		#expect(throws: RomanNumeralsError.invalidNumber.self) {
			try convertToRomanNumerals(from: number)
		}
	}
	
	@Test(
		"Test Numerals Error",
		arguments: [
			"E",
			"Y",
			"Q",
			"#",
			"*",
			"VRRRRR",
			"MMN",
			"IIII",
			"VV",
			"IC",
			"MMMM",
			"IXI",
			"VIV",
			"XCX",
			"Xx"
		]
	)
	func numeralsErrorTest(romanNumerals: String) {
		#expect(throws: RomanNumeralsError.invalidRomanNumerals.self) {
			try convertFromRomanNumerals(from: romanNumerals)
		}
	}
}
