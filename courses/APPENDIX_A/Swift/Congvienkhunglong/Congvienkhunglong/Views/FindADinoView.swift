//
//  FindADinoView.swift
//  Dinopedia
//
//  Created by Stem PhuocBuu on 8/26/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

@MainActor
struct FindADinoView: View {
    
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(HeadsetPositionManager.self) var headsetPositionManager
    @Environment(\.dismissWindow) var dismissWindow
    @Environment(\.openWindow) var openWindow
    
    @State private var nameOfDino = ""
    @State private var dinoDescription = ""
    @State private var isDinoDescriptionVisible = false
    
    let dinoDescriptions = [
        "Brachiosaurus" : "Brachiosaurus là một loài khủng long ăn cỏ khổng lồ với cổ dài, sống vào thời kỳ Jura muộn, khoảng 154 đến 153 triệu năm trước. Đặc trưng bởi tư thế độc đáo với chi trước dài hơn chi sau, nó có thể vươn cao để ăn các loại thực vật mà những loài ăn cỏ khác không thể tiếp cận. Với chiếc cổ dài và đầu nhỏ, Brachiosaurus thường được xem là một trong những biểu tượng kinh điển của loài khủng long khổng lồ, hiền lành, lang thang trong những khu rừng cổ đại. Kích thước đồ sộ cùng quá trình trao đổi chất chậm giúp nó tránh được phần lớn các loài săn mồi",
        "T-Rex" : "Tyrannosaurus rex, thường được gọi là T. rex, là một trong những loài khủng long ăn thịt lớn và đáng sợ nhất, sống vào thời kỳ Creta muộn, khoảng 68 đến 66 triệu năm trước. T. rex có thể cao tới 6 mét và dài hơn 12 mét, là một loài săn mồi mạnh mẽ với hộp sọ lớn, chứa những chiếc răng lớn, sắc bén để nghiền xương và xé thịt. Đôi chân sau khỏe giúp nó di chuyển với tốc độ đáng kinh ngạc, trong khi đôi tay tuy nhỏ nhưng có cơ bắp, có lẽ được dùng để giữ con mồi. T. rex có các giác quan nhạy bén, đặc biệt là thị giác và khứu giác, khiến nó trở thành một kẻ săn mồi và ăn xác hiệu quả. Là một trong những loài khủng long không thuộc nhóm chim cuối cùng trước sự kiện tuyệt chủng hàng loạt, T. rex vẫn là một trong những loài khủng long biểu tượng và được nghiên cứu nhiều nhất trong ngành cổ sinh vật học.",
        "Stegosaurus" : "Stegosaurus là một loài khủng long ăn cỏ lớn sống vào thời kỳ Jura muộn, khoảng 155 đến 150 triệu năm trước. Loài này dễ dàng nhận biết nhờ hàng đôi các tấm xương lớn dọc theo lưng và chiếc đuôi có gai, gọi là thagomizer, có thể được dùng để phòng thủ chống lại kẻ săn mồi. Mặc dù có ngoại hình ấn tượng, Stegosaurus lại có bộ não nhỏ so với kích thước cơ thể, cho thấy nó không thông minh bằng một số loài khủng long khác.",
        "Triceratops" : "Triceratops là một loài khủng long ăn cỏ lớn sống ở Bắc Mỹ vào thời kỳ Creta muộn, khoảng 68 đến 66 triệu năm trước. Với ba chiếc sừng nổi bật trên mặt và một mào xương lớn ở phía sau đầu, Triceratops là một trong những loài khủng long dễ nhận biết nhất. Những đặc điểm này có thể vừa là cơ chế phòng thủ chống lại kẻ săn mồi như Tyrannosaurus rex, vừa là phương tiện giao tiếp xã hội trong loài. Mặc dù có vẻ ngoài dữ tợn, Triceratops là loài ăn thực vật, dùng mỏ khỏe để cắt cỏ cây và cơ hàm mạnh để nhai những loại thực vật cứng.",
        "Velociraptor" : "Velociraptor là một loài khủng long ăn thịt nhỏ, có lông, sống vào thời kỳ Creta muộn, khoảng 75 đến 71 triệu năm trước. Nổi tiếng với sự nhanh nhẹn và tốc độ, Velociraptor là một thợ săn điêu luyện, sở hữu một móng vuốt hình lưỡi liềm đặc trưng trên mỗi chân, được dùng để bắt và giữ chặt con mồi. Mặc dù chỉ có kích thước tương đương với gà tây, trí thông minh và hành vi săn mồi theo bầy của nó khiến Velociraptor trở thành một thợ săn đáng gờm. Bằng chứng hóa thạch cho thấy Velociraptor có lông, tạo mối liên hệ gần gũi với các loài chim hiện đại, và chúng sống ở những khu vực ngày nay thuộc Trung Á, đặc biệt là Mông Cổ.."
    ]
    
    @State private var environment: EnvironmentResource!
    @State private var magnifyingGlass = Entity()
    
    var body: some View {
        RealityView { content, attachments in
            let dinoWorld = Entity()
            dinoWorld.components.set(WorldComponent())
            
            content.add(dinoWorld)
            // make all entities except the portal a child of this world.
            
            let dinoViewingPortal = createPortal(target: dinoWorld)
            dinoViewingPortal.transform.rotation = simd_quatf(angle: deg2rad(90), axis: [1,0,0])
            // visionos 2.0 only. dinoViewingPortal.components.set(BillboardComponent())
            content.add(dinoViewingPortal)
            
            if let magnifyingGlassScene = try? await Entity(named: "MagnifyingGlassScene", in: realityKitContentBundle) {
                if let magnifyingGlass = magnifyingGlassScene.findEntity(named: "MagnifyingGlass") {
                    self.magnifyingGlass = magnifyingGlass
                    content.add(magnifyingGlass)
                    magnifyingGlass.position = [0, 1, -1]
                    //magnifyingGlass.scale *= 2
                }
                
                if let portalAnchor = magnifyingGlass.findEntity(named: "PortalAnchor") {
                    portalAnchor.addChild(dinoViewingPortal)
                }
                
                if let nameLabel = attachments.entity(for: "NameOfDino") {
                    nameLabel.transform.rotation = simd_quatf(angle: deg2rad(-90), axis: [1,0,0])
                    nameLabel.position += [0, 0, -0.19]
                    dinoViewingPortal.addChild(nameLabel)
                }
                
                if let dinoDescription = attachments.entity(for: "DinoInfo") {
                    dinoViewingPortal.addChild(dinoDescription)
                    dinoDescription.transform.rotation = simd_quatf(angle: deg2rad(-90), axis: [1,0,0])
                    dinoDescription.position += [0.2, 0, 0.3]
                }
            }
            
            // This is the name of the folder with the .skybox extension, not the file name.
            guard let environment = try? await EnvironmentResource(named: "PartiallyCloudySkybox") else {
                fatalError("Cannot load environment")
            }
            self.environment = environment
            
            let skybox = await createSkyboxEntity(texture: "skybox2")
            //content.add(skybox)
            //content.add(await loadAllDinos())
            dinoWorld.addChild(skybox)
            dinoWorld.addChild(await loadAllDinos())
            
            if let experienceInfo = attachments.entity(for: "ExperienceInfo") {
                content.add(experienceInfo)
                experienceInfo.transform.rotation = simd_quatf(angle: deg2rad(-45), axis: [1,0,0])
                experienceInfo.position += [0, 0.5, -0.7]
            }
            
           
        } update: { content, attachments in
            
        } attachments: {
            Attachment(id: "NameOfDino") {
                if(nameOfDino != "") {
                    Text(nameOfDino)
                        .font(.largeTitle)
                        .padding()
                        .glassBackgroundEffect()
                }
            }
            
            Attachment(id: "DinoInfo") {
                if(isDinoDescriptionVisible) {
                    VStack(spacing: 20) {
                        if(dinoDescription != "") {
                            Text(dinoDescription)
                                .font(.callout)
                                .animation(.easeInOut)
                        }
                    }
                    .padding(20)
                    .glassBackgroundEffect()
                    .frame(width: 450)
                }
            }
            
            Attachment(id: "ExperienceInfo") {
                    VStack(spacing: 20) {
                        Text("Welcome to find a dino!")
                            .font(.title)
                        Text("Kéo tay cầm của kính lúp để di chuyển và chạm vào các loài khủng long để xem thông tin của chúng.")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary)
                        
                        Button(action: {
                            Task {
                                await dismissImmersiveSpace()
                            }
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.headline)
                                .padding()
                        })
                        
                    }
                    .padding(20)
                    .glassBackgroundEffect()
                    .frame(width: 450)
            }
        }
        .gesture(SpatialTapGesture()
            .targetedToAnyEntity()
            .onEnded({ value in
                nameOfDino = value.entity.name
                isDinoDescriptionVisible = true
                dinoDescription = dinoDescriptions[nameOfDino] ?? ""
            }))
        .gesture(DragGesture().targetedToEntity(magnifyingGlass).onChanged({ value in
            nameOfDino = ""
            isDinoDescriptionVisible = false
            magnifyingGlass.position = value.convert(value.location3D, from: .local, to: magnifyingGlass.parent!)
            
            // I used a fake camera pos in the video but in this example using ARKit to get device position
            // Take a look at HeadsetPositionManager for the entire dance of getting the camera position
            // With billboard component, you will not need any of this.
            
            //fake camera position
            //let cameraPos = SIMD3<Float>(0, 1, 0)
            
            let offsettedHeadsetPosition = headsetPositionManager.deviceLocation.position + [0, -0.3, 0]
            // offsetting headset position so we get a better angle when manipulating the magnifying glass
            
            magnifyingGlass.look(at: offsettedHeadsetPosition,
                                 from: magnifyingGlass.position,
                                 upVector: [0,1,0], relativeTo: nil)
            if let portal = magnifyingGlass.findEntity(named: "PortalAnchor") {
                portal.transform.rotation = simd_quatf(angle: deg2rad(180), axis: [0,1,0])
            }
        }))
        .onAppear {
            dismissWindow(id: DinopediaApp.homeView)
        }
        .onDisappear {
            openWindow(id: DinopediaApp.homeView)
        }
        
        // all the task below are for getting the headset position
        // you don't need this if you are using the billboard component in Vision OS 2
        .task {
            await headsetPositionManager.monitorSessionEvents()
        }
        .task {
            do {
                if headsetPositionManager.dataProvidersAreSupported && headsetPositionManager.isReadyToRun {
                    try await headsetPositionManager.session.run([headsetPositionManager.worldTracking])
                } else {
                    await dismissImmersiveSpace()
                }
            } catch {
                logger.error("Failed to start session: \(error)")
                await dismissImmersiveSpace()
                fatalError()
            }
        }
        .task {
            await headsetPositionManager.processDeviceAnchorUpdates()
        }
    }
    
    func loadAllDinos() async -> Entity {
        let allDinos = Entity()
        
        if let brachio = try? await Entity(named: "Brachiosaurus", in: realityKitContentBundle) {
            brachio.name = "Brachiosaurus"
            brachio.position += [15, -2, -10]
            brachio.scale *= 30
            brachio.transform.rotation = simd_quatf(angle: deg2rad(-45), axis: [0,1,0])
            allDinos.addChild(brachio)
            
            brachio.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 2))
            brachio.components.set(ImageBasedLightReceiverComponent(imageBasedLight: brachio))
            
            brachio.components.set(InputTargetComponent())
            brachio.components.set(CollisionComponent(shapes: [.generateBox(width: 15, height: 50, depth: 80).offsetBy(translation: [0,25,0])]))
            brachio.components.set(HoverEffectComponent())
            
            let anim = brachio.availableAnimations[0]
            brachio.playAnimation(anim.repeat())
        }
        
        if let trex = try? await Entity(named: "Trex", in: realityKitContentBundle) {
            trex.name = "T-Rex"
            trex.position += [-15, 0, -10]
            trex.scale *= 2
            trex.transform.rotation = simd_quatf(angle: deg2rad(45), axis: [0,1,0])
            allDinos.addChild(trex)
            
            trex.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 2))
            trex.components.set(ImageBasedLightReceiverComponent(imageBasedLight: trex))
            
            trex.components.set(InputTargetComponent())
            
            let collision = CollisionComponent(shapes: [.generateBox(width: 400, height: 400, depth: 400).offsetBy(translation: [0,200,0])])
            trex.components.set(collision)
            
            trex.components.set(HoverEffectComponent())
            
            let anim = trex.availableAnimations[0]
            trex.playAnimation(anim.repeat())
        }
        
        if let stego = try? await Entity(named: "Stegosaurus", in: realityKitContentBundle) {
            stego.name = "Stegosaurus"
            stego.position += [5, 0, -10]
            stego.scale *= 1
            stego.transform.rotation = simd_quatf(angle: deg2rad(25), axis: [0,1,0])
            allDinos.addChild(stego)
            
            stego.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 2))
            stego.components.set(ImageBasedLightReceiverComponent(imageBasedLight: stego))
            
            stego.components.set(InputTargetComponent())
            stego.components.set(CollisionComponent(shapes: [.generateBox(width: 200, height: 200, depth: 200).offsetBy(translation: [0,100,0])]))
            stego.components.set(HoverEffectComponent())
            
            let anim = stego.availableAnimations[0]
            stego.playAnimation(anim.repeat())
        }
        
        if let triceratops = try? await Entity(named: "Triceratops", in: realityKitContentBundle) {
            triceratops.name = "Triceratops"
            triceratops.position += [0, 0, -10]
            triceratops.scale *= 1
            triceratops.transform.rotation = simd_quatf(angle: deg2rad(10), axis: [0,1,0])
            allDinos.addChild(triceratops)
            
            triceratops.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 2))
            triceratops.components.set(ImageBasedLightReceiverComponent(imageBasedLight: triceratops))
            
            triceratops.components.set(InputTargetComponent())
            triceratops.components.set(CollisionComponent(shapes: [.generateBox(width: 200, height: 200, depth: 200).offsetBy(translation: [0,100,0])]))
            triceratops.components.set(HoverEffectComponent())
            
            let anim = triceratops.availableAnimations[0]
            triceratops.playAnimation(anim.repeat())
        }
        
        if let velociraptor = try? await Entity(named: "Velociraptor", in: realityKitContentBundle) {
            velociraptor.name = "Velociraptor"
            velociraptor.position += [-5, 0, -10]
            velociraptor.scale *= 1
            velociraptor.transform.rotation = simd_quatf(angle: deg2rad(-25), axis: [0,1,0])
            allDinos.addChild(velociraptor)
            
            velociraptor.components.set(ImageBasedLightComponent(source: .single(environment), intensityExponent: 2))
            velociraptor.components.set(ImageBasedLightReceiverComponent(imageBasedLight: velociraptor))
            
            velociraptor.components.set(InputTargetComponent())
            velociraptor.components.set(CollisionComponent(shapes: [.generateBox(width: 200, height: 200, depth: 200).offsetBy(translation: [0,100,0])]))
            velociraptor.components.set(HoverEffectComponent())
            
            let anim = velociraptor.availableAnimations[0]
            velociraptor.playAnimation(anim.repeat())
        }
        
        return allDinos
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
    
    func createPortal(target: Entity) -> Entity {
        let portalMesh = MeshResource.generatePlane(width: 0.3, depth: 0.3, cornerRadius: 0.15)// meters
        let portal = ModelEntity(mesh: portalMesh, materials: [PortalMaterial()])
        portal.components.set(PortalComponent(target: target))
        return portal
    }
    
    func deg2rad(_ number: Float) -> Float {
        return number * .pi / 180
    }
}

#Preview {
    FindADinoView()
}
