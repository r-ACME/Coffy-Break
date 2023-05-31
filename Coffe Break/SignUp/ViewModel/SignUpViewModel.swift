//
//  SignUpViewModel.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation
import SwiftUI
import Combine

class SignUpViewModel : ObservableObject{
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var fullName = ""
    @Published var age = ""
    @Published var password = ""
    @Published var weight = ""
    @Published var sensible = YesNo.no
    @Published var pregnant = YesNo.no
    @Published var gender = Gender.male
    
    @Published var uiState: SignUpUIState = .none
    
    
    func login( email: String, password: String){
        
        self.uiState = .loading  //para barra de progresso e carregamento
        
        
    }
    
    func errorFix () {
        
        self.uiState = .none
    }
    
    func signInView() -> some View{
        return SignUpViewRouter.makeSignInView()
    }
    
    func signup(){
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.uiState = .success
            self.publisher.send(true)
        }
    }
    
    func signUpFinish() -> some View{
        
        homeView()
    }
    
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
    
    func ageIsValid() -> Bool{
        let number = Double(age) ?? 0.0
        
        return (number > 0 && number < 150)
    }
    
    func weightIsValid() -> Bool{
        let number = Double(weight) ?? 0.0
        
        return (number > 0 && number < 1000)
    }
}
