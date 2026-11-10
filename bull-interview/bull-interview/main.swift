//
//  main.swift
//  bull-interview
//
//  Created by นพคุณ อนันตกิจถาวร on 9/11/2569 BE.
//

import Foundation
import AutoComplete
import Bracket
import ModernRomanNumerals
import PositiveIntSort
import StringSort
import Tribonacci

print("Select any program to continue")

while true {
	print(
  """
  1) Test #1(Bracket)
  2) Test #2(String Sort)
  3) Test #3(Autocomplete)
  4) Test #4(Modern Roman Numerals)
  5) Test #5(Positive Int Sort)
  6) Test #6(Tribonacci)
  q) Quit
  """)
	printInputPrefix()
	switch readLine()?.lowercased() {
	case "1":
		runFunction {
			try calculateBracket()
		}
	case "2":
		sortServerName()
	case "3":
		searchAutocomplete()
	case "4":
		runFunction {
			try convertRomanNumerals()
		}
	case "5":
		runFunction {
			try sortPositiveInt()
		}
	case "6":
		runFunction {
			try calculateTribonacci()
		}
	case "q", nil:
		exit(0)
	default:
		print("You can only select 1, 2, 3, 4, 5, 6, or q.")
	}
}

func calculateBracket() throws {
	print("Type the string you want to test")
	printInputPrefix()
	guard let value = readLine()?.lowercased() else { return }
	print("\(try Bracket.validateBrackets(list: value))")
}

func sortServerName() {
	print(StringSort.sortServer(list: inputStringList()))
}

func searchAutocomplete() {
	print("Type the search keyword.")
	printInputPrefix()
	guard let search = readLine() else { exit(0) }
	let items = inputStringList()
	let maxResult = inputInt()
	print(AutoComplete.autocomplete(search: search, items: items, maxResult: maxResult))
}

func convertRomanNumerals() throws {
	print("Which option do you wish to do?")
	while true {
		print("1) Integer to Roman Numerals 2) Roman Numerals to Integer")
		printInputPrefix()
		switch readLine() {
		case "1":
			let value = inputInt()
			print(try ModernRomanNumerals.convertToRomanNumerals(from: value))
		case "2":
			let value = inputString()
			print (try ModernRomanNumerals.convertFromRomanNumerals(from: value))
		default:
			print("You can only choose 1 and 2")
		}
	}
}

func sortPositiveInt() throws {
	print("Type Positive Int")
	printInputPrefix()
	let value = inputInt()
	print(try PositiveIntSort.sortPositiveInt(value: value))
}

func calculateTribonacci() throws {
	let items = inputIntList()
	print("Type max result")
	printInputPrefix()
	let maxResult = inputInt()
	print(try Tribonacci.getTribonacci(items: items, maxResult: maxResult))
}

func inputStringList() -> [String] {
	print("Type the list of string you want and type q once you're done")
	var values: [String] = []
	while true {
		printInputPrefix()
		guard let value = readLine()?.lowercased(), value != "q" else { return values }
		values.append(value)
	}
}

func inputIntList() -> [Int] {
	print("Type the list of integer you want and type q ocne you're done")
	var values: [Int] = []
	print("Type the Integer")
	while true {
		printInputPrefix()
		let value = readLine()?.lowercased() ?? ""
		guard let value = Int(value) else {
			if value == "q" {
				return values
			} else {
				print("Not an integer, please try again.")
				continue
			}
		}
		values.append(value)
	}
	return values
}

func inputInt() -> Int {
	print("Type the Integer")
	printInputPrefix()
	while true {
		let value = readLine()?.lowercased() ?? ""
		guard let value = Int(value) else {
			print("Not an integer, please try again.")
			continue
		}
		return value
	}
}

func inputString() -> String {
	print("Type the input")
	printInputPrefix()
	while true {
		guard let value = readLine() else {
			print("Something went wrong. Please try agian.")
			continue
		}
		return value
	}
}

func runFunction(function: () throws -> ()) {
	do {
		try function()
	} catch {
		print(error.localizedDescription)
	}
	while true {
		print("Do you want to continue?")
		print("y) yes n) No")
		printInputPrefix()
		switch readLine()?.lowercased() {
		case "y":
			return
		case "n":
			exit(0)
		default:
			print("You can only select y or n")
		}
	}
}

func printInputPrefix() {
	print("> ", terminator: "")
}
