//
//  CustomTextField.swift
//  TextFieldWithFloatingPlaceholder
//
//  Created by Андрей Коваленко on 23.01.2024.
//

import UIKit

class FloatingPlaceholderTextField: UITextField {

    // MARK: - Свойства

    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()

    // MARK: - Инициализаторы

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Настройка

    private func commonInit() {
        
        addSubview(floatingLabel)
        floatingLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        floatingLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        // Регистрируемся на события изменения текста
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }


    // MARK: - Методы UITextFieldDelegate

    override func layoutSubviews() {
        super.layoutSubviews()

        // Регулируем положение плавающего лейбла в зависимости от того, пусто ли поле или нет
        if !text!.isEmpty {
            floatingLabel.textColor = .blue // Устанавливаем цвет, когда текст введен
            floatingLabel.font = UIFont.systemFont(ofSize: 12)
            floatingLabel.transform = CGAffineTransform(translationX: 0, y: -floatingLabel.bounds.size.height + 16)
            floatingLabel.text = "Подсказка"
        } else {
            floatingLabel.textColor = .gray // Устанавливаем цвет по умолчанию
            floatingLabel.font = UIFont.systemFont(ofSize: 16)
            floatingLabel.transform = .identity
            floatingLabel.text = ""
        }
    }

    // MARK: - Событие изменения текста

    @objc private func textFieldDidChange() {
        setNeedsLayout()
    }
}
