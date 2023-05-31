//
//  SignUpUIState.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation

enum SignUpUIState : Equatable{
    case none
    case loading
    case success
    case error(String)
}
