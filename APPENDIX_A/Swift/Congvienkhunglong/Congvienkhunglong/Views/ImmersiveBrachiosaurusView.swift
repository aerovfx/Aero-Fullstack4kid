//
//  ImmersiveView.swift
//  Dinopedia
//
//  Created by Stem PhuocBuu on 8/24/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

@MainActor
struct ImmersiveBrachiosaurusView: View {
    
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    @PhysicalMetric(from: .meters) var smallDinoWidth = 0.2
    
    var body: some View {
        RealityView { content, attachments in
            
            // the resolution of the ibl should be very small. mostly hd...
            // This is the name of the folder with the .skybox extension, not the file name.
            guard let environment = try? await EnvironmentResource(named: "PartiallyCloudySkybox") else {
                fatalError("Cannot load environment light")
            }
            
            if let brachio = try? await Entity(named: "Brachiosaurus", in: realityKitContentBundle) {
                brachio.position += [2, 0, -8]
                brachio.scale *= 20
                brachio.transform.rotation = simd_quatf(angle: deg2rad(-45), axis: [0,1,0])
                content.add(brachio)
                
                //print(brachio.availableAnimations.count)
                let anim = brachio.availableAnimations[0]
                brachio.playAnimation(anim.repeat())
                
                brachio.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 3))
                brachio.components.set(ImageBasedLightReceiverComponent(imageBasedLight: brachio))
            }
            
            let skybox = await createSkyboxEntity(texture: "skybox2")
            content.add(skybox)
            
            guard let infoCard = attachments.entity(for: "BrachioInfo") else {
                fatalError("Cannot load brachio info attachment")
            }
            content.add(infoCard)
            infoCard.position += [0, 0.5, -1.2] // meters
            
            if let miniBrachio = attachments.entity(for: "MiniBrachio" ) {
                infoCard.addChild(miniBrachio)
                miniBrachio.position = [0, 0.7, 0.05]
                miniBrachio.transform.rotation = simd_quatf(angle: .pi/2, axis: [0,1,0])
                
                miniBrachio.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 2.5))
                miniBrachio.components.set(ImageBasedLightReceiverComponent(imageBasedLight: miniBrachio))
            }
            
        } update: { content, attachments in
            
        } attachments: {
            Attachment(id: "BrachioInfo") {
                VStack {
                    Text("Brachiosaurus là một loài khủng long ăn cỏ khổng lồ, có cổ dài, sống vào thời kỳ Jura muộn, khoảng 154 đến 153 triệu năm trước. Đặc điểm nổi bật của nó là tư thế độc đáo với chi trước dài hơn chi sau, cho phép nó vươn cao để ăn những loại cây mà các loài ăn cỏ khác không thể với tới. Với chiếc cổ dài và đầu nhỏ, Brachiosaurus thường được coi là biểu tượng của hình ảnh khủng long khổng lồ, hiền lành đi lang thang trong các khu rừng cổ đại. Kích thước khổng lồ cùng với quá trình trao đổi chất chậm giúp nó tránh được hầu hết các loài săn mồi")
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
            
            Attachment(id: "MiniBrachio") {
                Model3D(named: "Brachiosaurus", bundle: realityKitContentBundle) { model in
                    model
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(depth: nil, alignment: .center)
                .frame(width: smallDinoWidth)
            }
        }
        .onAppear {
            dismissWindow(id: DinopediaApp.homeView)
        }
        .onDisappear {
            openWindow(id: DinopediaApp.homeView)
        }
    }
    
    func createSkyboxEntity(texture: String) async -> Entity {
        guard let resource = try? await TextureResource(named: texture) else {
            fatalError("Unable to load the skybox")
        }
        
        var material = UnlitMaterial()
        material.color = .init(texture: .init(resource))
        
        let entity = Entity()
        entity.components.set(ModelComponent(mesh: .generateSphere(radius: 1000), materials: [material]))
        entity.scale *= .init(x: -1, y:1, z:1)
        return entity
    }
    
    func deg2rad(_ number: Float) -> Float {
        return number * .pi / 180
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveBrachiosaurusView()
}
