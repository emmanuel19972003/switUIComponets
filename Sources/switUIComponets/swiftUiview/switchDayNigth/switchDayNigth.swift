//
//  switchDayNigth.swift
//  swiftUI in UIkit
//
//  Created by Emmanuel on 16/01/24.
//

import SwiftUI
import Combine

public class switchDayNigthViewModel: ObservableObject {
    @Published public var isSelected: Bool = false
    
    public func toggle() {
        isSelected.toggle()
    }
    public init(isSelected: Bool = false) {
        self.isSelected = isSelected
    }
}

public struct switchDayNigth: View {
    @ObservedObject public var vm: switchDayNigthViewModel
    let size: CGFloat
    
    public init(vm: switchDayNigthViewModel, size: CGFloat) {
        self.vm = vm
        self.size = size
    }
    
    private let nightColor = Color(red: 32/255, green: 62/255, blue: 120/255)
    public var body: some View {
        ZStack {
            Group {
                Capsule()
                    .fill(.black).opacity(vm.isSelected ? 0.8 : 0.8)
                    .frame(width: size * 1.01, height: size * 0.51)
                Capsule()
                    .fill(.shadow(.inner(radius: 5, x:1,  y: 0)))
                    .foregroundStyle(vm.isSelected ? .blue : nightColor)
                HStack {
                    if vm.isSelected {
                        cloudDay(size: size * 0.2)
                            .padding(.leading, size * 0.1)

                        Spacer()
                    } else {
                        Spacer()
                        Image(systemName: "cloud.moon.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundStyle(.white)
                            .frame(width: size * 0.2, height: size * 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.trailing, size * 0.1)
                        
                    }
                }
                
                concentricCircles(isSelected: vm.isSelected, radius: size * 0.45)
                    .offset(CGSize(width: vm.isSelected ? size * 0.24 : -(size * 0.24), height: 0.0))
                    .mask {
                        Capsule().frame(width: size, height: size * 0.5)
                    }
                
            }
            .animation(Animation.easeInOut(duration: 0.5), value: vm.isSelected)
            .frame(width: size, height: size * 0.5)
            
        }
        .onTapGesture {
            vm.isSelected.toggle()
        }
    }
}

private struct concentricCircles: View {
    var isSelected: Bool = false
    var radius: Double = 100
    let dayGradient = LinearGradient(
        colors: [Color(red: 230/255, green: 237/255, blue: 169/255),
                 Color(red: 215/255, green: 162/255, blue: 81/255)],
        startPoint: .top,
        endPoint: .bottom)
    
    let nightGradient = LinearGradient(
        colors: [Color(red: 247/255, green: 250/255, blue: 251/255),
                 Color(red: 74/255, green: 81/255, blue: 89/255)],
        startPoint: .top,
        endPoint: .bottom)
    let nightColor = Color(red: 200/255, green: 207/255, blue: 215/255)
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .opacity(0.1)
                .frame(width: radius * 2.0, height: radius * 2.0)
            Circle()
                .fill(.white)
                .opacity(0.2)
                .frame(width: radius * 1.75, height: radius * 1.75)
            Circle()
                .fill(.white)
                .opacity(0.3)
                .frame(width: radius * 1.40, height: radius * 1.40)
            Circle()
                .fill(isSelected ? dayGradient : nightGradient)
                .opacity(1)
                .frame(width: radius * 1.0 , height: radius * 1.0)
                .shadow(color: .black, radius: 5)
            Circle()
                .fill(isSelected ? .yellow : nightColor)
                .opacity(1)
                .frame(width: radius * 0.95 , height: radius * 0.95)
        }
        
    }
}

private struct cloudDay: View {
    var size: CGFloat = 100
    var body: some View {
        ZStack {
            Image(systemName: "cloud.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
                .opacity(0.6)
                .offset(CGSize(width: size * 0.3, height: -size * 0.15))
            
            Image(systemName: "cloud.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(1)
                .foregroundStyle(.white)
            
        }
        .frame(width: size, height: size)
    }
}


#Preview {
    switchDayNigth(vm: switchDayNigthViewModel(), size: 350)
}
