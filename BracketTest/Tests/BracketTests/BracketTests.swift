import Testing
@testable import Bracket

@Suite("Bracket Test")
struct brackets {
	@Test(
		"Testing Brackets",
		arguments: [
		("()", true),
		("([]]", false),
		("([{}])", true),
		("([[{}]]]])", false),
		(")", false),
		("(]}])", false),
		("([)]", false),
		("{", false),
		("[][[]]", true),
		("[{[[}]]]", false),
		("สวัสดีครับ", false),
		("Hell", false)
	])
	func validateBracketsTest(raw: String, expected: Bool) async throws {
		#expect(validateBrackets(list: raw) == expected)
	}
	
	@Test(
		"Testing Regular Expression",
		arguments: [
			("({)}}}})", true),
			("Is()::", false),
			("{{(t}}}", false),
			("{{{'}}{09000))))", false),
			("((((((", true),
			(")()())))))", true),
			("", false),
			("[[{{{", true),
			("Hello", false),
			("สวัสดีครับ", false),
			("ᐸᐸᐸᐳᐳᐳ", false)
		]
	)
	func isOnlyBracketsTest(raw: String, expected: Bool) async throws {
		#expect(isOnlyBrackets(raw) == expected)
	}
}
