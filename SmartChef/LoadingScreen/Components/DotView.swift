//
//  DotView.swift
//  cookify
//
//  Created by Enzo Kaniewska on 25.01.23.
//

import SwiftUI

struct DotView: View {
    @State var delay: Double = 0 // 1.
    @State var radius:CGFloat = 50
    @State var degrees:Double = 0
    @State var scale: CGFloat = 1
    var body: some View {
        Circle()
            .frame(width: 30, height: 30)
            .scaleEffect(scale)
            .offset(x: radius)
            .rotationEffect(Angle(degrees: degrees), anchor: .center)
            .animation(.linear(duration: 1.5)
                .repeatForever(autoreverses: false).delay(delay))
            .onAppear {
                self.scale = 0.5
                degrees = 360
                
            }
    }
}

struct DotView_Previews: PreviewProvider {
    static var previews: some View {
        DotView(delay: 0)
    }
}
