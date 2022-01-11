//
//  ContentView.swift
//  MerryChristmas
//
//  Created by Lyvennitha on 24/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let backg = VStack{
            Text("Merry Christmas")
                .font(.custom("SnellRoundhand-Bold", size: 40))
                .foregroundColor(Color.white)
                .animation(.easeInOut)
            HStack(alignment: .center){
                
                Image("Tree")
                    .resizable()
                    .scaledToFit()
                Text("🎄🌟🌲")
                    .font(.custom("SnellRoundhand-Bold", size: 30))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, -30.0)
                    .padding(.trailing, 30.0)
                    .animation(.easeInOut)
                
            }
            
            
            Image("Gifts")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        }
        
        HStack{
            ChristmasView()
                .background(backg)
        }
        .background(LinearGradient(gradient:Gradient(colors: [ Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),  Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.6316129723))]) , startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChristmasView: UIViewRepresentable{
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let host = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let particleLayer = CAEmitterLayer()
        particleLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        host.layer.addSublayer(particleLayer)
        host.layer.masksToBounds = false
        particleLayer.backgroundColor = UIColor.clear.cgColor
        particleLayer.emitterShape = .circle
        particleLayer.emitterPosition = CGPoint(x: 0.0, y: 0.0)
        particleLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particleLayer.emitterMode = .surface
        particleLayer.renderMode = .oldestLast
        particleLayer.emitterCells = [addCell()]
        return host
    }
    
    func addCell() -> CAEmitterCell{
        let cell = CAEmitterCell()
        let image = UIImage(named: "Snow")?.cgImage
        cell.contents = image
        cell.name = "Snow"
        cell.birthRate = 52.0
        cell.lifetime = 20.0
        cell.velocity = 19.0
        cell.velocityRange = -15.0
        cell.xAcceleration = 5.0
        cell.yAcceleration = 40.0
        cell.emissionRange = 180.0 * (.pi / 180.0)
        cell.spin = -28.6 * (.pi / 180.0)
        cell.spinRange = 57.2 * (.pi / 180.0)
        cell.scale = 0.06
        cell.scaleRange = 0.2
        cell.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        return cell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
