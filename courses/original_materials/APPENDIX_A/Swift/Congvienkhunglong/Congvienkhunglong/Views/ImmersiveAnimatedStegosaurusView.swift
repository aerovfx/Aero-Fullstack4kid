//
//  ImmersiveAnimatedStegosaurusView.swift
//  Dinopedia
//
//  Created by Stem PhuocBuu on 8/25/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveAnimatedStegosaurusView: View {
    
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        RealityView { content, attachments in
            if let stego = try? await Entity(named: "Stegosaurus", in: realityKitContentBundle) {
                
                stego.position += [0, 0, -2]
                stego.transform.rotation = simd_quatf(angle: .pi/2, axis: [0,1,0])
                content.add(stego)
                
                //print(stego.availableAnimations.count)
                let anim = stego.availableAnimations[1]
                stego.playAnimation(anim.repeat())
                
                stego.enumerateHierarchy { entity, stop in
                    if entity is ModelEntity{
                        entity.components.set(GroundingShadowComponent(castsShadow: true))
                    }
                }
                
                if let infoCard = attachments.entity(for: "StegoInfo") {
                    content.add(infoCard)
                    infoCard.position += [1, 0.5, -1.7] // meters
                }
            }
        } update: { content, attachments in
            
        } attachments: {
            Attachment(id: "StegoInfo") {
                VStack {
                    Text("Stegosaurus là một loài khủng long ăn cỏ lớn sống vào thời kỳ Jura muộn, khoảng 155 đến 150 triệu năm trước. Loài này dễ dàng nhận ra nhờ hàng đôi các tấm xương lớn dọc theo lưng và chiếc đuôi có gai, gọi là thagomizer, mà nó có thể đã sử dụng để phòng thủ chống lại kẻ săn mồi. Mặc dù có ngoại hình ấn tượng, Stegosaurus lại có bộ não nhỏ so với kích thước cơ thể, cho thấy nó không thông minh bằng một số loài khủng long khác.")
                        .font(.largeTitle)
                        .frame(width: 700)
                    Button(action: {
                        Task {
                            await dismissImmersiveSpace()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .padding()
                    })
                }
                .padding(50)
                .glassBackgroundEffect()
            }
        }
        .onAppear {
            dismissWindow(id: DinopediaApp.homeView)
        }
        .onDisappear {
            openWindow(id: DinopediaApp.homeView)
        }
    }
}

#Preview {
    ImmersiveAnimatedStegosaurusView()
}
