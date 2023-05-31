//
//  SignUpViewRouter.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI


enum SignUpViewRouter{
    
    static func makeSignInView() -> some View{
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
