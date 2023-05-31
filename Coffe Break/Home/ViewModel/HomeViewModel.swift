//
//  HomeViewModel.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var uiState: SplashUIState = .loading
    
    @Published var quantity = 0.0
    @Published var type = CaffeineInputType.cup
    
    func onAppear(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        }
    }

    func calculate(){
        
        
    }
}
