//
//  Feature.swift
//  TCA-1
//
//  Created by 정의찬 on 9/4/24.
//

import Foundation
import ComposableArchitecture

struct Feature: Reducer {
    
    struct State: Equatable {
        var count: Int = 1
    }
    
    enum Action {
        case decrease
        case increase
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrease:
                state.count -= 1
                return .none
            case .increase:
                state.count += 1
                return .none
            }
        }
    }
}
