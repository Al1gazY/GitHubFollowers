//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 10.11.2023.
//

import Foundation

extension Date{
    
    func convertToMonthYearFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
