public func autocomplete(search: String, items: [String], maxResult: Int) -> [String] {
	guard maxResult > 0 && !search.isEmpty else { return [] }
	let filterdItems = searchList(keyword: search, items: items)
	return Array(sortItems(keyword: search, items: filterdItems).prefix(maxResult))
}

func searchList(keyword: String, items: [String]) -> [String] {
	guard !keyword.isEmpty else { return [] }
	return items.filter { $0.lowercased().contains(keyword.lowercased())}
}

func sortItems(keyword: String, items: [String]) -> [String] {
	let mappedFilterItems = items
		.map { item -> (position: Int, item: String) in
			guard let range = item.lowercased().firstRange(of: keyword.lowercased()) else { return (.max, item) }
			return (item.distance(from: item.startIndex, to: range.lowerBound), item)
		}
	return mappedFilterItems.sorted { $0.position != $1.position ? $0.position < $1.position : $0.item < $1.item }
		.map(\.item)
}
