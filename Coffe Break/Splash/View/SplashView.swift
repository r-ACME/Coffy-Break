//
//  ContentView.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    
    var body: some View {
        Group{
            switch viewModel.uiState{
                case .loading:
                    LoadingView()
                case .goToSignInScreen:
                    viewModel.selectionView()
                case .goToHomeScreen:
                    Text("Carregar tela Home")
                case .error(let msg):
                    errorView(error: msg)
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}


struct LoadingView: View{
    var body:some View{
        ZStack{
            Image("CupOfCoffe")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 200, maxHeight: 200)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            Text("Loading")
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottom)
                .padding()
        }
    }
}


extension SplashView{
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
