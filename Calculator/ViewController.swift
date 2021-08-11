//
//  ViewController.swift
//  Calculator
//
//  Created by Facheng Liang on 2021/8/10.
//

import UIKit

class ViewController: UIViewController {
  private let stackView: UIStackView = .init()
  private let textField: UITextField = .init()
  private let calcButton: UIButton = .init()

  private var operationHandler: OperationHandler {
    let operation = textField.text!
    let handlers: [Handler] = [
      AddHandler(operation: operation),
      SubHandler(operation: operation),
      MulHandler(operation: operation),
      DivHandler(operation: operation),
    ]
    return OperationHandler(
      operation: operation,
      handlers: handlers
    )
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

  @objc
  private func calc() {
    let operation = textField.text!
    let result = operationHandler.operate()
    textField.text = "\(operation)=\(result)"
  }

  private func setupUI() {
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.widthAnchor.constraint(equalToConstant: 300),
      stackView.heightAnchor.constraint(equalToConstant: 200),

      textField.heightAnchor.constraint(equalToConstant: 50),
      calcButton.heightAnchor.constraint(equalToConstant: 50),
    ])

    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.gray.cgColor
    stackView.addArrangedSubview(textField)

    calcButton.backgroundColor = .blue
    calcButton.setTitle("Calculate", for: .normal)
    calcButton.addTarget(self, action: #selector(calc), for: .touchUpInside)
    stackView.addArrangedSubview(calcButton)
  }
}
