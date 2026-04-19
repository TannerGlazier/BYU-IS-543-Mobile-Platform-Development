import UIKit

func calculate(description: String, operation: (Double, Double)-> Double) {
    let result = operation(5, 3)
    print("\(description)(5, 3): \(result)")
}


calculate(description: "Multiply", operation: { (o1, o2) -> Double in o1 * o2 })
calculate(description: "Divide", operation: { (o1, o2) -> Double in o1 / o2 })
calculate(description: "Power", operation: { (o1, o2) -> Double in pow(o1, o2) })
