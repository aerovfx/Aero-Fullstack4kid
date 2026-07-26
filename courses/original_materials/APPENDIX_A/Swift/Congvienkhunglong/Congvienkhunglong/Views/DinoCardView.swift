//
//  DinoCardView.swift
//  Dinopedia
//
//  Created by Stem PhuocBuu on 8/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DinoCardView: View {
    
    @Environment(\.openWindow) private var openWindow
        
    var body: some View {
        VStack(spacing: 50) {
            
            Text("Velociraptor")
                .font(.extraLargeTitle2)
                .padding(40)
            
                Model3D(named: "Velociraptor", bundle: realityKitContentBundle) { model in
                    model
                        .resizable()
                        .scaledToFit()
                        .rotation3DEffect(.degrees(90 ) , axis: .y)
                } placeholder: {
                    ProgressView()
                }
                .frame(depth: 200, alignment: .center)
                .frame(height: 200)
                .overlay(alignment: .bottom) {
                    Button(action: {
                        openWindow(id: DinopediaApp.velociraptorVolume)
                    }, label: {
                        Text("Show Model")
                    })
                    .frame(width: 200)
                }
           
            Text("Velociraptor là một loài khủng long nhỏ, nhanh nhẹn và thông minh, nổi tiếng với móng vuốt sắc bén và khả năng săn mồi trong thời kỳ Creta")
                .frame(maxWidth: 500)
                .padding(40)
        }
        //.glassBackgroundEffect()
    }
}

#Preview {
    DinoCardView()
}
