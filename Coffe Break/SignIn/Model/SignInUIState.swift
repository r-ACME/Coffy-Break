//
//  SignInUIState.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation

enum SignInUIState : Equatable{
    case none
    case loading
    case goToHomeScreen
    case goToSignUp
    case error(String)
}
