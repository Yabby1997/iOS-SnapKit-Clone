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
    
    private lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
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
            make.bottom.equalTo(self.view.bottomAnchor).offset(-30).priority(.defaultLow)
            make.leading.equalTo(self.view.leadingAnchor).offset(30)
            make.trailing.equalTo(self.view.trailingAnchor).offset(-30)
            make.height.equalTo(50).priority(.defaultHigh)
        }
        
        self.view.addSubview(redSquare)
        redSquare.makeConstraints { make in
            make.top.equalTo(self.purpleSquare.bottomAnchor).offset(30)
            make.leading.equalTo(self.view.leadingAnchor).priority(800)
            make.trailing.equalTo(self.view.trailingAnchor).priority(800)
            make.width.equalTo(self.view.widthAnchor).multipledBy(0.5).priority(.required)
            make.height.equalTo(10)
        }
        
        self.view.addSubview(blueSquare)
        blueSquare.makeConstraints { make in
            make.centerX.equalTo(self.view.centerXAnchor).offset(35)
            make.centerY.equalTo(self.view.centerYAnchor).offset(80)
            make.height.equalTo(100)
            make.width.equalTo(300)
        }
    }
}

