//
//  pkeball.swift
//  swiftUI in UIkit
//
//  Created by Emmanuel on 12/01/24.
//

import SwiftUI

public enum pokeBallTypes {
    case normal
    case great
    case ultra
    case master
    case premier
    
    var topColor: Color {
        switch self {
        case .normal:
            Color.red
        case .great:
            Color.blue
        case .ultra:
            Color.gray
        case .master:
            Color.purple
        case .premier:
            Color.white
        }
    }
    
    var middleColor: Color {
        switch self {
        case .premier:
            Color.red
        default:
            Color.black
        }
    }
}

struct PokeBall: View {
    let viewsize: Double
    var type: pokeBallTypes
    var body: some View {
        ZStack {
            Circle()
                .fill(.black)
            Circle()
                .trim(from: 0.5, to: 1)
                .fill(type.topColor)
                .frame(width: viewsize*0.9, height: viewsize*0.9)
                .frame(width: viewsize*0.9, height: viewsize*0.9)
            Circle()
                .trim(from: 0.5, to: 1)
                .fill(.white)
                .rotationEffect(.degrees(180))
                .frame(width: viewsize*0.9, height: viewsize*0.9)
            Rectangle()
                .fill(type.middleColor)
                .frame(width: viewsize*0.9, height: viewsize*0.05)
            Circle()
                .fill(type.middleColor)
                .frame(width: viewsize*0.4, height: viewsize*0.4)
            Circle()
                .fill(.white)
                .frame(width: viewsize*0.3, height: viewsize*0.3)
            
        }.frame(width: viewsize, height: viewsize)
    }
}

#Preview {
    PokeBall(viewsize: 300, type: .premier)
}
