//
//  SplashViewRouter.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI


enum SplashViewRouter{
    
    static func makeSignInView() -> some View{
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
    static func makeSelectionView() -> some View{
        let viewModel = SelectionViewModel()
        return SelectionView(viewModel: viewModel)
    }
}
