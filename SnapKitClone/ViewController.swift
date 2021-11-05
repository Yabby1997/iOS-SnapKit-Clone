//
//  ViewController.swift
//  SnapKitClone
//
//  Created by Seunghun Yang on 2021/11/05.
//

import UIKit

class ViewController: UIViewController {
    private lazy var purpleSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    private lazy var redSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    private func configureUI() {
        self.view.addSubview(purpleSquare)
        purpleSquare.makeConstraints { make in
            make.top.equalTo(self.view.topAnchor).offset(30)
            make.bottom.equalTo(self.view.bottomAnchor).offset(-200)
            make.leading.equalTo(self.view.leadingAnchor).offset(30)
            make.trailing.equalTo(self.view.trailingAnchor).offset(-30)
        }
        
        self.view.addSubview(redSquare)
        redSquare.makeConstraints { make in
            make.top.equalTo(self.purpleSquare.bottomAnchor).offset(30)
            make.bottom.equalTo(self.view.bottomAnchor).offset(-30)
            make.leading.equalTo(self.view.leadingAnchor).offset(30)
            make.trailing.equalTo(self.view.trailingAnchor).offset(-30)
        }
    }
}

