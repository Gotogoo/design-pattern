//
//  AddHandler.swift
//  Calculator
//
//  Created by Facheng Liang on 2021/8/11.
//

import Foundation

struct AddHandler: Handler {
  var operation: String
  var operationSymbol: Character {
    return "+"
  }

  init(operation: String) {
    self.operation = operation
  }

  func handle() -> Int {
    let (first, second) = parse()
    return first + second
  }
}
