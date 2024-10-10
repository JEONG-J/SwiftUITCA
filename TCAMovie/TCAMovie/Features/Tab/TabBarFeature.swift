//
//  TabBarFeature.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct TabBarFeature {
    @ObservableState
    struct State: Equatable {
        var selectedTab: Tab = .home
    }
    
    enum Action: Equatable {
        case selectedTab(Tab)
    }
    
    enum Tab: Hashable {
        case home
        case glass
        case tag
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .selectedTab(tab):
                state.selectedTab = tab
                return .none
            }
        }
    }
}
