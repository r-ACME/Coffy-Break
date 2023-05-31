//
//  HomeView.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        GeometryReader{proxy in
            VStack{
                VStack{
                   Text("Quanto foi consumido?")
                    Slider(
                                value: $viewModel.quantity,
                                in: 0...10
                    ).padding()
                            Text("\(viewModel.quantity)")
                    Picker("origin", selection: $viewModel.type){
                        ForEach(CaffeineInputType.allCases, id: \.self){
                            value in
                            Text(value.rawValue).tag(value)
                        }
                    }
                }
                ZStack(alignment: .bottomTrailing){
                    LoadingButtonView(action: {viewModel.calculate()},
                                      text: "Calcular",
                                      disabled: false,
                                      showProgress: false)
                    .frame(width: .infinity, height: .infinity, alignment: .bottom)
                    .padding(.leading, proxy.size.width/2)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
