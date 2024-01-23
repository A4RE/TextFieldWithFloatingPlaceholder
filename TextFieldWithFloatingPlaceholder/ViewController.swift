//
//  ViewController.swift
//  TextFieldWithFloatingPlaceholder
//
//  Created by Андрей Коваленко on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 26
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.green.cgColor
        
        
        let floatingTextField = FloatingPlaceholderTextField()
        floatingTextField.placeholder = "Что-то"
        floatingTextField.translatesAutoresizingMaskIntoConstraints = false
        floatingTextField.font = .systemFont(ofSize: 16)
        
        let topConstraint = floatingTextField.topAnchor.constraint(equalTo: backView.topAnchor)
        let bottomConstraint = floatingTextField.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        
        view.addSubview(backView)
        backView.addSubview(floatingTextField)
        
        NSLayoutConstraint.activate([
            
            backView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backView.heightAnchor.constraint(equalToConstant: 52),
            
            topConstraint,
            bottomConstraint,
            floatingTextField.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 24),
            floatingTextField.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -24)
        ])
    }
    


}

