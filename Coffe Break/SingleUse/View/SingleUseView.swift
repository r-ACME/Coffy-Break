//
//  SingleUseView.swift
//  Coffe Break
//
//  Created by coltec on 11/05/23.
//

import SwiftUI

struct SingleUseView: View {
    
    @ObservedObject var viewModel: SingleUseViewModel
    
    var body: some View {
        Group{
            switch viewModel.uiState{
                case .none:
                    main()
                case .calculated:
                    viewModel.alertView()
                case .error(let msg):
                    errorView(error: msg)
            }
        }
    }
}

struct SingleUseView_Previews: PreviewProvider {
    static var previews: some View {
        SingleUseView(viewModel: SingleUseViewModel())
    }
}

extension SingleUseView{
    func main() -> some View{
        VStack{
            HStack{
                Text("Tipo de Usuário: ")
                Picker("consumer", selection: $viewModel.consumer){
                    ForEach(Consumer.allCases, id: \.self){
                        value in
                        Text(value.rawValue).tag(value)
                    }
                }
            }
            
            HStack{
                EditTextView(placeholder: "Xicara de Café",
                             text: $viewModel.cup,
                             error: "",
                             failure: false,
                             keyboard: UIKeyboardType.numberPad,
                             isSecure: false)
                Text(" xicaras de café")
            }
            HStack{
                EditTextView(placeholder: "Remedios",
                             text: $viewModel.pill,
                             error: "",
                             failure: false,
                             keyboard: UIKeyboardType.numberPad,
                             isSecure: false)
                Text(" comprimidos de remedio")
            }
            HStack{
                EditTextView(placeholder: "Chocolates",
                             text: $viewModel.chocolate,
                             error: "",
                             failure: false,
                             keyboard: UIKeyboardType.numberPad,
                             isSecure: false)
                Text(" barras de chocolate")
            }
            HStack{
                EditTextView(placeholder: "Outras fontes",
                             text: $viewModel.other,
                             error: "",
                             failure: false,
                             keyboard: UIKeyboardType.numberPad,
                             isSecure: false)
                Text(" outras fontes - 100mg de cafeina")
            }
            
            LoadingButtonView(action: {viewModel.calculate()},
                              text: "Calcular",
                              disabled: viewModel.cup.count < 1 &&
                              viewModel.pill.count < 1 &&
                              viewModel.chocolate.count < 1 &&
                              viewModel.other.count < 1 )

        }
        .padding()
    }
}


extension SingleUseView{
    func errorView(error: String? = nil) -> some View{
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
