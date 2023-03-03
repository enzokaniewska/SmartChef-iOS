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
    
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieData.startAngle + pieData.endAngle).radians / 2.0
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                let radius1 = geometry.size.width * 0.5
                let centerX = geometry.size.width/2
                let centerY = geometry.size.height/2
                let center = CGPoint(x: centerX, y: centerY)
                
                ArcShape(pieData: pieData, centerX: centerX, centerY: centerY, radius: radius1)
                    .fill(pieData.color)
                    
                    
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


