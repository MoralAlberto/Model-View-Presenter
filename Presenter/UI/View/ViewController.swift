//
//  ViewController.swift
//  Presenter
//
//  Created by Alberto Moral on 01/12/2016.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: ShowUserPresenter?
    var textfield: UITextField?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 200, y: 200, width: 300, height: 200)
        textfield = UITextField(frame: rect)
        textfield?.backgroundColor = UIColor.red
        view.addSubview(textfield!)
        view.backgroundColor = UIColor.green
        
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: ViewProtocol {
    func renderView() {
        print("USERS: \(presenter?.users)")
        textfield?.text = presenter?.users.first?.name
    }
}

