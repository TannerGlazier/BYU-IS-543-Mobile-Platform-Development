import Foundation

// Functional Programmming uses three important functions:
// filter, reduce and map.

// Filter returns an array whose elements pass a test you give

//Reduce applies a computation to each element of an array and returns the result


//Map transforms an array into another array of the same size,
// but it applies some computation on each element in the old
// array to produce a new element in the new array

// we start with filter

let cards = ["Jack", "Queen", "King", "Joker"]
var eCards = cards.filter { card in card.contains("e") }

print("cards containing e: \(eCards)")

eCards = cards.filter { $0.contains("e") }
print("cards containing e: \(eCards)")

let numbers = [1, 2, 3, 4, 5]
var evenNumbers = numbers.filter({ number in
        number % 2 == 0
})

print("evenNumbers: \(evenNumbers)")

evenNumbers = numbers.filter { $0 % 2 == 0 }
print("evenNumbers: \(evenNumbers)")

// On to reduce

var totalOfNumbers = numbers.reduce(0) { total, number in
        total + number
}

print("total: \(totalOfNumbers)")

totalOfNumbers = numbers.reduce(0) { $0 + $1 }
print("total: \(totalOfNumbers)")

let productOfNumbers = numbers.reduce(1) { $0 * $1 }
print("product: \(productOfNumbers)")

// and finally, map

let doubleNumbers = numbers.map {number in
    number * 2
}

print("doubled numbers: \(doubleNumbers)")

let countOfCardNames = cards.map { $0.count }

print("card lengths: \(countOfCardNames)")


//var newArray = Array<Int>()
//
//numbers.forEach { number in
//    if number % 2 == 0 {
//        newArray.append(number)
//    }
//}
//
//print("iterative even numbers: \(newArray)")

