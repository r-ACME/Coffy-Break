//
//  SignInViewModel.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI
import Combine

class SignInViewModel : ObservableObject{
    
    private var cancellable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
    
    @Published var uiState: SignInUIState = .none
    
    @Published var email = ""
    @Published var password = ""
    
    init(){
        cancellable = publisher.sink{ value in
            if(value){
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    func login(){
        
        self.uiState = .loading  //para barra de progresso e carregamento
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .goToHomeScreen
            //self.uiState = .error("Usuário ou senha incorretos")
        }
        
    }
    
    func errorFix () {
        
        self.uiState = .none
    }
    
    func homeView() -> some View{
        return SignInViewRouter.makeHomeView()
    }
    
    func signUp(){
        self.uiState = .goToSignUp
    }
    
    func signUpView() -> some View{
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
    
    deinit{
        cancellable?.cancel()
    }
}
