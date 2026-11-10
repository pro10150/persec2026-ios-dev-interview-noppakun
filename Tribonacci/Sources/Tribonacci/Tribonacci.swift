/// Assumption: กรณีที่ items มีน้อยกว่า 3 ให้แทนค่าทีมีเรียงจากซ้ายไปขวาตามที่ define ไว้ใน Wolfraam MathWorld:
/// The tribonacci sequence is a generalization of the Fibonacci numbers. It is defined by T_0=0, T_1=1, T_2=1, T_3=2, and the recurrence equation
/// ตัวอย่าง:
/// ถ้าส่งค่ามา [] ให้ใช้ 0, 1, 1 เป็นค่าเริ่มต้น
/// ถ้าส่งค่ามา [x] ให้ใช้ x, 1, 1 เป็นค่าเริ่มต้น
/// ถ้าส่งค่ามา [x, y] ให้ใช้ x, y, 1
public func getTribonacci(items: [Int], maxResult: Int) throws -> [Int] {
	guard maxResult >= 0 else { throw TribonacciError.negativeMaxResult }
	guard items.count < 4 else { throw TribonacciError.itemOverflow }
	guard maxResult != 0 else { return [] }
	var result = getSeed(items: items)
	guard maxResult > items.count else { return Array(items.prefix(maxResult)) }
	for _ in 3..<maxResult {
		result.append(calculateNextValue(items: Array(result.suffix(3))))
	}
	return result
}

func getSeed(items: [Int]) -> [Int] {
	return items + [0, 1, 1].dropFirst(items.count)
}

func calculateNextValue(items: [Int]) -> Int {
	return items.reduce(0, { $0 + $1 })
}

enum TribonacciError: Error {
	case negativeMaxResult
	case itemOverflow
}
