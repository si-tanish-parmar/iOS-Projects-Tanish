import UIKit

//class Student: Equatable{
//    var name = ""
//    var id = 0
//    init(name: String, id: Int) {
//        self.name = name
//        self.id = id
//    }
//    static func == (lhs: Student, rhs: Student) -> Bool{
//        return lhs.name == rhs.name && lhs.id == rhs.id
//    }
//}
//
//let s1 = Student.init(name: "Tanish", id: 1)
//let s2 = Student.init(name: "Tanish", id: 2)
//
//if s1 == s2{
//    print("equal")
//}
//else{
//    print("not equal")
//}

//class Student: Comparable{
//    
//    
//    var name = ""
//    var id = 0
//    init(name: String, id: Int) {
//        self.name = name
//        self.id = id
//    }
//    static func == (lhs: Student, rhs: Student) -> Bool{
//        return lhs.name == rhs.name && lhs.id == rhs.id
//    }
//    static func < (lhs: Student, rhs: Student) -> Bool {
//        return lhs.id < rhs.id
//    }
//}
//
//let s1 = Student.init(name: "Tanish", id: 1)
//let s2 = Student.init(name: "Tanish", id: 2)
//
//if s1 < s2{
//    print("s1 < s2")
//}
//else{
//    print("s1 > s2")
//}

class Student: Hashable{
    
    
    var name = ""
    var id = 0
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    static func == (lhs: Student, rhs: Student) -> Bool{
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name.hashValue)
        hasher.combine(id.hashValue)
    }
}

let s1 = Student.init(name: "Tanish", id: 1)
let s2 = Student.init(name: "Tanh", id: 2)

print(s1.hashValue)
print(s2.hashValue)



