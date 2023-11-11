//
//  FavoritesListVC.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 05.11.2023.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        PersistenceManager.retrieveFavorites { result in
            switch result{
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }

    }

}
