//
//  HomeViewController.swift
//  my_movies
//
//  Created by Savyo Brenner on 16/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    
    private func bindUI() {
        viewModel.isLoading = {
            
        }
        viewModel.reloadData = {
            
        }
    }
}
