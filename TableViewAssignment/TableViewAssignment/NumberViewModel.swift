//
//  NumberViewModel.swift
//  TableViewAssignment
//
//  Created by Tanish Parmar on 11/10/23.
//

import Foundation
class NumberViewModel {
    private var numbers: [Int] = (1...100).map { $0 }

    func numberOfNumbers() -> Int {
        return numbers.count
    }

    func number(at index: Int) -> Int {
        return numbers[index]
    }
}
