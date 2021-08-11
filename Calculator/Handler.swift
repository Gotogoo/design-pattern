//
//  Handler.swift
//  Calculator
//
//  Created by Facheng Liang on 2021/8/11.
//

import Foundation

protocol Handler {
  var operation: String { get }
  var operationSymbol: Character { get }

  func shouldHandle() -> Bool
  func parse() -> (Int, Int)
  func handle() -> Int
}

extension Handler {
  func shouldHandle() -> Bool {
    operation.contains(operationSymbol)
  }

  func parse() -> (Int, Int) {
    let numbers = operation.split(separator: operationSymbol)
    let first = Int(numbers.first!)!
    let second = Int(numbers.last!)!
    return (first, second)
  }
}
