//
//  SubHandler.swift
//  Calculator
//
//  Created by Facheng Liang on 2021/8/11.
//

import Foundation

struct SubHandler: Handler {
  var operation: String
  var operationSymbol: Character {
    return "-"
  }

  func handle() -> Int {
    let (first, second) = parse()
    return first - second
  }
}
