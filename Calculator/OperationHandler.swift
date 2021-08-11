//
//  OperationHandler.swift
//  Calculator
//
//  Created by Facheng Liang on 2021/8/10.
//

import Foundation

struct OperationHandler {
  private let operation: String
  private let handlers: [Handler]

  init(operation: String, handlers: [Handler]) {
    self.operation = operation
    self.handlers = handlers
  }

  func operate() -> Int {
    handlers
      .filter { $0.shouldHandle() }
      .first!
      .handle()
  }
}





