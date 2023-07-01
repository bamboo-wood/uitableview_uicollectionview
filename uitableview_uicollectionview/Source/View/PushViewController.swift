//
//  PushViewController.swift
//  uitableview_uicollectionview
//
//  Created by 佐々木一樹 on 2023/07/01.
//
import UIKit

class PushViewController: UIViewController {

    var fooView: PushView!

    override func loadView() {
        super.loadView()
        self.fooView = PushView(frame: .zero)
        self.view = self.fooView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class PushView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setComponent()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setComponent(){
        self.backgroundColor = .white
    }

    private func setConstraint(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
