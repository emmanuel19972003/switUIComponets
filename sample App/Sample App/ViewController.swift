//
//  ViewController.swift
//  swiftUI in UIkit
//
//  Created by Emmanuel on 11/01/24.
//

import UIKit
import SwiftUI
import Combine
import switUIComponets

class ViewController: UIViewController {
    
    var diaWsitch: AnyCancellable?
    
    var masterSwitch: AnyCancellable?
    
    //MARK: -VIEW COMPONENTS
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var daySwitch: UIHostingController = {
        let view = UIHostingController(rootView: switchDayNigth(vm: switchDayNigthViewModel(), size: 120))
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var normlaPokevalSwitch: UIHostingController = {
        let view = UIHostingController(rootView: PokeBallSwitch(delegaet: pokebalDelegate(), type: .normal, size: 120))
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var greatPokevalSwitch: UIHostingController = {
        let view = UIHostingController(rootView: PokeBallSwitch(delegaet: pokebalDelegate(), type: .great, size: 120))
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var masterPokevalSwitch: UIHostingController = {
        let view = UIHostingController(rootView: PokeBallSwitch(delegaet: pokebalDelegate(), type: .master, size: 120))
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: -viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillstackView()
        
        self.view.addSubview(stackView)
        stackViewConstraint()
        
        swithdidchage()
        
    }
    //MARK: -Set up funcs
    
    func fillstackView() {
        stackView.addArrangedSubview(daySwitch.view)
        stackView.addArrangedSubview(normlaPokevalSwitch.view)
        stackView.addArrangedSubview(greatPokevalSwitch.view)
        stackView.addArrangedSubview(masterPokevalSwitch.view)
        
        stackView.addArrangedSubview(UIView())
    }
    
    func stackViewConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

extension ViewController {
    
    func swithdidchage() {
        diaWsitch = daySwitch.rootView.vm.$isSelected.sink(receiveValue: { value in
            print("lo lograste \(value)")
        })
        
        masterSwitch = masterPokevalSwitch.rootView.delegaet.$isAble.sink(receiveValue: { value in
            print("lo lograste la master \(value)")
        })

    }
    
}



