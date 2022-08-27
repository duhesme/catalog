//
//  SearchView.swift
//  catalog
//
//  Created by Никита Владимирович on 25.08.2022.
//

import UIKit

final class SearchView: UIView {

    var placeholder: String = "" {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                .foregroundColor: Asset.Colors.Base.lightGray
            ])
        }
    }

    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    private var searchBackView: UIView = {
        let view = UIView()
//        view.layer.cornerRadius = 22
        view.backgroundColor = .white
        return view
    }()

    private var searchIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Assets.Main.Search.magnifier.image
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var clearIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.Assets.Main.Search.clear.image
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    lazy private var iconsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10

        return stackView
    }()

    private var textField: UITextField = {
        let textField = UITextField()
        textField.setContentHuggingPriority(UILayoutPriority(rawValue: 300), for: .horizontal)
        textField.tintColor = Asset.Colors.Base.textColor.color
        textField.textColor = Asset.Colors.Base.textColor.color
        textField.font = FontFamily.MarkPro.regular.font(size: 12)
        textField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [
            .font: FontFamily.MarkPro.regular.font(size: 12),
            .foregroundColor: Asset.Colors.Base.lightGray.color
        ])
        textField.returnKeyType = UIReturnKeyType.search
        textField.enablesReturnKeyAutomatically = true
        return textField
    }()

    private var cancelButton: UIButton = {
        let button = UIButton()

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addElements()
        addTargets()

        clearIconImageView.isHidden = true
        cancelButton.isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setValue(query: String) {
        textField.text = query
    }

    func clear() {
        clearButtonClicked()
    }

    func becomeResponder() {
        textField.becomeFirstResponder()
    }

    func resignResponder() {
        textField.resignFirstResponder()
    }

    private func addTargets() {
        searchIconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchButtonClicked)))
        clearIconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clearButtonClicked)))
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
    }


    @objc private func searchButtonClicked() {
        textField.becomeFirstResponder()
    }

    @objc private func clearButtonClicked() {
        textField.text = ""
    }

    @objc private func cancelButtonClicked() {
        clearIconImageView.isHidden = true
        cancelButton.isHidden = true
        textField.text = ""
        textField.resignFirstResponder()
    }


    private func addElements() {

        addSubview(searchIconImageView)

        addSubview(searchBackView)
        iconsStackView.addArrangedSubview(searchIconImageView)
        iconsStackView.addArrangedSubview(textField)
        iconsStackView.addArrangedSubview(clearIconImageView)

        searchBackView.addSubview(iconsStackView)

        mainStackView.addArrangedSubview(searchBackView)
        mainStackView.addArrangedSubview(cancelButton)

        addSubview(mainStackView)

        makeConstraintrs()
    }

    private func makeConstraintrs() {
        searchIconImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(16)
            make.left.equalToSuperview().inset(24)
        }

        clearIconImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(14)
        }


        searchBackView.snp.makeConstraints { (make) in
//            make.height.equalTo(40)
        }

        iconsStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
        }

        mainStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()

        }

        cancelButton.snp.makeConstraints { (make) in
            make.width.equalTo(60)
        }
    }
}
