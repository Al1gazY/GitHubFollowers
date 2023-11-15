//
//  ErrorMessages.swift
//  GHFollowers
//
//  Created by Aligazy Kismetov on 07.11.2023.
//

import Foundation

enum GFError: String, Error{
    
    case invalidUsername = "Error. Invalid username."
    case unableToComplete = "Error. Please check your internet connection."
    case invalidResponce = "Error. Invalid responce from the server."
    case invalidData = "Error. The data was invalid."
    case unableToFavorite = "Error favoriting this user."
    case alreadyInFavorites = "Error. You've already favorited this user."
}
