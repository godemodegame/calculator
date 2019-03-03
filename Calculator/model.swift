import Foundation

func operationWithTwoOperands(operrandOne: Double, sign: String, operrandTwo: Double) -> Double {
    switch sign {
    case "+":
        return operrandOne + operrandTwo
    case "-":
        return operrandOne - operrandTwo
    case "×":
        return operrandOne * operrandTwo
    case "÷":
        return operrandOne / operrandTwo
    case "xʸ":
        return pow(operrandOne, operrandTwo)
    default:
        return 0404
    }
}

func operationWithOneOperand(operand: Double, sign: String) -> Double {
    switch sign {
    case "x²":
        return pow(operand, 2)
    case "x³":
        return pow(operand, 3)
    case "√":
        return pow(operand, 0.5)
    case "cos":
        return cos(operand * Double.pi / 180)
    case "sin":
        return sin(operand * Double.pi / 180)
    case "tg":
        return tan(operand * Double.pi / 180)
    case "ctg":
        return cos(operand * Double.pi / 180) / sin(operand * Double.pi / 180)
    case "x!":
        var factorial = 1
        for i in 2...Int(operand) {
            factorial *= i
        }
        return Double(factorial)
    case "1/x":
        return 1 / operand
    case "%":
        return operand / 100
    case "+/-":
        if operand != 0 {
            return operand * -1
        } else {
            return operand
        }
    default:
        return 0404
    }
}
