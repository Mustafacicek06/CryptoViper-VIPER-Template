//
//  View.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation
import UIKit


// View Talks to -> Presenter
// class, protocol
// View Controller

protocol AnyView {
    var present: AnyPresenter? {get set}
    
    // cryptos update or error update
    func update(with cryptos : [CryptoModel])
    func update(with error: String)
}

class CryptoViewController: UIViewController {
    var present: AnyPresenter?
    
    var cryptos: [CryptoModel] = []
    
    private let tableView: UITableView = {
        let table = UITableView()
        // custom class or self
        table.register(UITableView.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        
        label.isHidden = false
        label.text = "Downloading..."
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .blue
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    // we are adding subviews beacuse No Storyboard
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // screen size of table
        tableView.frame = view.bounds
        // view size - self size
        messageLabel.frame = CGRect(x: view.frame.width/2 - 100 , y: view.frame.height/2 - 25, width: 200, height: 50)
    }
    
    func update(with cryptos: [CryptoModel]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        
    }
    
    
}

extension CryptoViewController: AnyView , UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

