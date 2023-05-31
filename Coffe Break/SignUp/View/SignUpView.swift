//
//  SignUpView.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        
        Group{
            switch viewModel.uiState{
            case .none:
                NavigationView{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 10){
                            HStack{
                                fullNameInput
                            }
                            HStack{
                                passwordInput
                            }
                            HStack{
                                ageInput
                            }
                            HStack{
                                weightInput
                            }
                            HStack{
                                sensitivityInput
                            }
                            HStack{
                                pregnancyInput
                            }
                            HStack{
                                buttonSignUp
                            }
                        }
                    }.padding(.top, 10)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 32)
                        .background(Color.white)
                        .navigationBarTitle("SignUp", displayMode: .inline)
                }
                
            case .loading:
                Text("Loading...")
            case .success:
                viewModel.signUpFinish()
            case .error(let msg):
                loadingView(error: msg)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}

extension SignUpView{
    var fullNameInput: some View{
        EditTextView( placeholder: "Informe nome completo",
                      text: $viewModel.fullName,
                      error: "Nome precisa ter pelo menos 3 caracteres",
                      failure: viewModel.fullName.count < 3,
                      keyboard: .alphabet)
    }
}

extension SignUpView{
    var ageInput: some View{
        EditTextView( placeholder: "Informe sua idade",
                      text: $viewModel.age,
                      error: "Idade precisa ser entre 0 e 100",
                      failure: !viewModel.ageIsValid(),
                      keyboard: .numberPad)
    }
}

extension SignUpView{
    var passwordInput: some View{
        EditTextView( placeholder: "Preencha sua senha",
                      text: $viewModel.password,
                      error: "Senha precisa ter pelo menos 8 caracteres",
                      failure: viewModel.password.count < 8,
                      keyboard: .emailAddress,
                      isSecure: true)
    }
}

extension SignUpView{
    var weightInput: some View{
        EditTextView( placeholder: "Informe seu peso",
                      text: $viewModel.weight,
                      error: "Peso invalido",
                      failure: !viewModel.weightIsValid(),
                      keyboard: .numberPad)
    }
}

extension SignUpView{
    var sensitivityInput: some View{
        VStack(alignment: .leading){
            Text("Sensivel a cafeina?")
            Picker("Sensivel?", selection: $viewModel.sensible){
                ForEach(YesNo.allCases, id: \.self){
                    value in
                    Text(value.rawValue).tag(value)
                }
            }
        }
    }
}

extension SignUpView{
    var pregnancyInput: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Genero: ")
                Picker("Genero", selection: $viewModel.gender){
                    ForEach(Gender.allCases, id: \.self){
                        value in
                        Text(value.rawValue).tag(value)
                    }
                }
            }
            if(viewModel.gender == Gender.female){
                VStack(alignment: .leading){
                    Text("Está gravida?")
                    Picker("Gravida?", selection: $viewModel.pregnant){
                        ForEach(YesNo.allCases, id: \.self){
                            value in
                            Text(value.rawValue).tag(value)
                        }
                    }
                }.padding()
            }
        }
    }
}

extension SignUpView{
    var buttonSignUp: some View{
        LoadingButtonView(action: {viewModel.signup()},
                          text: "Cadastre-se",
                          disabled: viewModel.fullName.count < 3 ||
                          !viewModel.ageIsValid() ||
                          viewModel.password.count < 8 ||
                          !viewModel.weightIsValid(),
                          showProgress: self.viewModel.uiState == SignUpUIState.loading)
    }
}

extension SignUpView{
    func loadingView(error: String? = nil) -> some View{
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(title: Text("Coffe Break"),
                              message: Text(error),
                              dismissButton:
                                .cancel(Text("Cancelar")){viewModel.errorFix()}
                        )
                    };
            }
            
            
        }
    }
}
