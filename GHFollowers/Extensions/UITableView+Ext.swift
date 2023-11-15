//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 15.11.2023.
//

import UIKit

extension UITableView{
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
}
