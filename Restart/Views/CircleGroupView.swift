//
//  CircleGroupView.swift
//  Restart
//
//  Created by Giap on 11/01/2023.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isShapeAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: Zstack
        .blur(radius: isShapeAnimating ? 0 : 10)
        .opacity(isShapeAnimating ? 1 : 0)
        .scaleEffect(isShapeAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 0.5), value: isShapeAnimating)
        .onAppear(perform: {
            isShapeAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
