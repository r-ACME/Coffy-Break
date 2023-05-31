//
//  SplashViewModel.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI

class SplashViewModel: ObservableObject{
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .goToSignInScreen
        }
    }
    
    func signInView() -> some View{
        return SplashViewRouter.makeSignInView()
    }
    
    func selectionView() -> some View{
        return SplashViewRouter.makeSelectionView()
    }
    
}
