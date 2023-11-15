//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 06.11.2023.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAllignment: NSTextAlignment){
        self.init(frame: .zero)
        self.textAlignment = textAllignment
    }
    
    private func configure(){
        
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
