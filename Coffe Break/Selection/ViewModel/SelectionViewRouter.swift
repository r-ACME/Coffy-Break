//
//  SelectionViewRouter.swift
//  Coffe Break
//
//  Created by coltec on 11/05/23.
//

import Foundation
import SwiftUI


enum SelectionViewRouter{
    
    static func makeSignInView() -> some View{
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
    static func makeSingleUseView() -> some View{
        let viewModel = SingleUseViewModel()
        return SingleUseView(viewModel: viewModel)
    }
}
