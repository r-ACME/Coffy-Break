//
//  SelectionViewModel.swift
//  Coffe Break
//
//  Created by coltec on 11/05/23.
//

import Foundation
import SwiftUI

class SelectionViewModel: ObservableObject{
    
    @Published var uiState: SelectionUIState = .none

    func goToSignInScreen(){
        self.uiState = .goToSignInScreen
    }
    func goToSingleUse(){
        self.uiState = .goToSingleUse
    }
    
    func signInView() -> some View{
        return SelectionViewRouter.makeSignInView()
    }
    
    func singleView() -> some View{
        return SelectionViewRouter.makeSingleUseView()
    }
}
