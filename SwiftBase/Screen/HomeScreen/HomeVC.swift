//
//  HomeViewController.swift
//  DemoMVVM
//
//  Created by Tu Pham on 2/20/20.
//  Copyright © 2020 Tu Pham. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class HomeViewController : UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    let homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    var categories =  [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        homeViewModel.resquestData()
        bindData()
        
    }
    
    func bindData() {
        homeViewModel
            .categories
            .subscribe(onNext: { data in
                self.categories = data
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        homeViewModel
            .isError
            .subscribe(onNext: { err in
                print("loi roi \(err) sua de")
            })
            .disposed(by: disposeBag)
        
        homeViewModel
            .isLoading
            .subscribe(onNext: { isLoading in
                if isLoading == true {
                    self.indicator.startAnimating()
                } else {
                    self.indicator.stopAnimating()
                }
                
            })
            .disposed(by: disposeBag)
        
    }
}

extension HomeViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
}
