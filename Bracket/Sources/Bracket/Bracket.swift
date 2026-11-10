public func validateBrackets(list: String) throws -> Bool {
	guard isOnlyBrackets(list) else { throw BracketError.InvalidInput }
	guard list.count % 2 == 0 else { return false }
	var stacks: [Character] = []
	let pairs: [Character: Character] = [")": "(", "]": "[", "}" : "{"]
	for char in list {
		if let open = pairs[char] {
			guard stacks.popLast() == open else { return false }
		} else if "({[".contains(char) { stacks.append(char) }
	}
	return stacks.isEmpty
}

func isOnlyBrackets(_ s: String) -> Bool {
	s.wholeMatch(of: /[()\[\]{}]+/) != nil
}

enum BracketError: Error {
	case InvalidInput
}
