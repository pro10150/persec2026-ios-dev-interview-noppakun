public func sortPositiveInt(value: Int) throws -> Int {
	guard value >= 0 else { throw SortPositiveError.negativeValue }
	guard let result = Int(String(String(value).sorted(by: >))) else {
		throw SortPositiveError.overflow
	}
	return result
}

enum SortPositiveError: Error {
	case negativeValue
	case overflow
}
