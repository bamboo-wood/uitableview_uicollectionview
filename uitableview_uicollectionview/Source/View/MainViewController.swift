//
//  MainViewController.swift
//  uitableview_uicollectionview
//
//  Created by 佐々木一樹 on 2023/07/01.
//

import UIKit

class MainViewController: UIViewController {
    var mainView: MainView!

    override func loadView() {
        super.loadView()
        mainView = MainView(frame: .zero)
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.pushButton.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
    }

    @objc func tapped(_: Any) {
        navigationController?.pushViewController(PushViewController(), animated: true)
    }
}

class MainView: UIView {
    let paddingView: PaddingView = {
        let paddingView = PaddingView(padding: 20)
        paddingView.backgroundColor = .systemGray5
        paddingView.layer.cornerRadius = 10
        return paddingView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10

        return stackView
    }()

    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This application is for learning UITableView and UICollectionView."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 3
        return label
    }()

    let pushButton: UIButton = {
        let button = UIButton()

        let container = AttributeContainer([
            .font: UIFont.boldSystemFont(ofSize: 15),
        ])

        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString("遷移する", attributes: container)
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemBlue
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        button.configuration = config
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setComponent()
        setConstraint()
    }

    private func setComponent() {
        backgroundColor = .white

        [helloLabel, descriptionLabel].forEach {
            stackView.addArrangedSubview($0)
        }

        paddingView.addPaddedSubview(stackView)

        [paddingView, pushButton].forEach {
            addSubview($0)
        }
    }

    private func setConstraint() {
        pushButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            paddingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            paddingView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            paddingView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            paddingView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            pushButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pushButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pushButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
