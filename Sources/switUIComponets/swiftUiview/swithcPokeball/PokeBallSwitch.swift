//
//  shapegeometry.swift
//  swiftUI in UIkit
//
//  Created by Emmanuel on 12/01/24.
//

import SwiftUI
import Combine

protocol didchageDelegate {
    func didchage()
}

public class pokebalDelegate: ObservableObject {
    @Published public var isAble: Bool = false
    public init(isAble: Bool = false) {
        self.isAble = isAble
    }
}

public struct PokeBallSwitch: View {
    @ObservedObject public var delegaet: pokebalDelegate
    var type: pokeBallTypes = .normal
    let size: Double
    public init(delegaet: pokebalDelegate, type: pokeBallTypes = .normal, size: Double) {
        self.delegaet = delegaet
        self.type = type
        self.size = size
    }
    public var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Capsule()
                    .fill(.gray)
                    .opacity(0.5)
                HStack {
                    PokeBall(viewsize: size * 0.4, type: type)
                        .rotationEffect(.degrees(delegaet.isAble ? 0 : -180))
                        .offset(CGSize(width: delegaet.isAble ? size * 0.25 : -size * 0.25, height: 0.0))
                }
                .frame(width: size * 0.9 , height: size * 0.45 )
                .animation(Animation.easeInOut(duration: 0.5), value: delegaet.isAble)
            } .frame(width: size, height: size / 2)
        }
        .foregroundStyle(.clear)
        .onTapGesture {
            delegaet.isAble.toggle()
        }
        
        
    }
}



#Preview {
    PokeBallSwitch(delegaet: pokebalDelegate(), type: .normal, size: 350)
}
