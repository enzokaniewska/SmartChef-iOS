//
//  PieChartSlice.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 03.10.22.
//

import SwiftUI

struct PieChartSlice: View {
    
    @State var showsPopover = false
    var pieData: PieChartData
    @State var isTapped = false
    
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieData.startAngle + pieData.endAngle).radians / 2.0
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                let radius1 = geometry.size.width * 0.5
                let radius2 = geometry.size.width * 0.55
                let centerX = geometry.size.width/2
                let centerY = geometry.size.height/2
                let center = CGPoint(x: centerX, y: centerY)
                
                ArcShape(pieData: pieData, centerX: centerX, centerY: centerY, radius: isTapped ? radius2 : radius1)
                    .fill(pieData.color)
                    .animation(.spring(), value: isTapped)
                    .simultaneousGesture(DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            isTapped = true
                        })
                        .onEnded({ _ in
                            isTapped = false
                        })
                    )
//                Path { path in
//
//                    let radius1 = geometry.size.width * 0.5
//                    let radius2 = geometry.size.width * 0.6
//                    let centerX = geometry.size.width/2
//                    let centerY = geometry.size.height/2
//                    let center = CGPoint(x: centerX, y: centerY)
//
//
//                    path.move(to: center)
//                    path.addArc(
//                        center: center,
//                        radius: isTapped ? radius1 : radius2,
//                        startAngle: .degrees(-90) + pieData.startAngle,
//                        endAngle: .degrees(-90) + pieData.endAngle,
//                        clockwise: false)
//                }
//                .fill(pieData.color)
//                .onTapGesture {
//                    withAnimation(.easeIn(duration: 1.0)){
//                        isTapped.toggle()
//                    }
//
//                }
                
                /*
                Text(pieData.text)
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
                    )
                    .foregroundColor(Color.white)
                    .bold()
                    .font(isTapped ? .title3 : .subheadline )
                    .animation(.spring(), value: isTapped)
                */
                
            }
            
            
        }
        .aspectRatio(1,contentMode: .fit)
        
        
        
    }
}

struct PieChartSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieChartSlice(pieData: PieChartData(startAngle: .degrees(0), endAngle: .degrees(90), color: .green, text: "60%"))
    }
}


struct ArcShape:Shape{
    
    var animatableData: CGFloat{
        get { radius }
        set { radius = newValue}
    }
    
    var pieData: PieChartData
    var centerX:CGFloat
    var centerY:CGFloat
    var radius:CGFloat

    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        let center = CGPoint(x: centerX, y: centerY)
        
        path.move(to: center)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(-90) + pieData.startAngle,
            endAngle: .degrees(-90) + pieData.endAngle,
            clockwise: false)
        
        
        
        return path
    
    }

}


