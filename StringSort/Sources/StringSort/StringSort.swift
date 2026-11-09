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
