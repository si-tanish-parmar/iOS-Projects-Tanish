import UIKit

func highestNumber<T:Comparable>(a:T,b:T){
    if a > b {
        print("a is greater")
    }
    else{
        print("b is greater")
    }
}


highestNumber(a: 222.23, b: 123)

func whatTypeIs<T>(input: T){
    print("The input is of type \(type(of: input))")
}

whatTypeIs(input: "Tanish")
whatTypeIs(input: 12)
