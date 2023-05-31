//
//  SelectionView.swift
//  Coffe Break
//
//  Created by coltec on 11/05/23.
//

import SwiftUI

struct SelectionView: View {
    
    @ObservedObject var viewModel: SelectionViewModel
    
    var body: some View {
        Group{
            switch viewModel.uiState{
                case .none:
                    choice()
                case .goToSignInScreen:
                    viewModel.signInView()
                case .goToSingleUse:
                    viewModel.singleView()
                case .error(let msg):
                    errorView(error: msg)
            }
        }
    }
}
struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(viewModel: SelectionViewModel())
    }
}


extension SelectionView{
    func choice() -> some View{
        VStack{
            VStack{
                LoadingButtonView(action: {viewModel.goToSignInScreen()},
                                  text: "Fazer login",
                                  disabled: false,
                                  showProgress: false)
            }
            VStack{
                LoadingButtonView(action: {viewModel.goToSingleUse()},
                                  text: "Calcular apenas um dia",
                                  disabled: false,
                                  showProgress: false)
            }
        }
        .padding()
    }
}


extension SelectionView{
    func errorView(error: String? = nil) -> some View{
        ZStack{
            Image("CupOfCoffe")
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
                                .cancel(Text("Cancelar")){}
                        )
                    }
            }
        }
    }
}
