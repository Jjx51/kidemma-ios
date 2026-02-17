//
//  Router.swift
//  com.kidemma
//
//  Created by Leonardo González on 29/10/25.
//

import Foundation

@Observable
class Router {
    var routes: [AppTab: [Route]] = [: ]
    
    /// Push to route
    func push(_ route: Route) {
        let tab = route.tab
        self.routes[tab, default: []].append(route)
    }
    
    /// Pop last route
    func pop() {
        let nonEmpty = routes.filter { !$0.value.isEmpty }
        if nonEmpty.count == 1, let tab = nonEmpty.first?.key {
            _ = routes[tab]?.popLast()
        }
    }
    
    subscript(tab: AppTab) -> [Route] {
        get { self.routes[tab] ?? [] }
        set { self.routes[tab] = newValue }
    }
    
    /// Pop en una pestaña específica
    func pop(in tab: AppTab) {
        guard var stack = routes[tab], !stack.isEmpty else { return }
        stack.removeLast()
        routes[tab] = stack
    }
    
    /// Pop de los últimos `n` elementos en una pestaña
    func pop(_ n: Int, in tab: AppTab) {
        guard n > 0, var stack = routes[tab], !stack.isEmpty else { return }
        stack.removeLast(min(n, stack.count))
        routes[tab] = stack
    }
    
    /// Vacía la pila de una pestaña
    func popToRoot(in tab: AppTab) {
        routes[tab] = []
    }
    
    /// Pop hasta que el predicado coincida con algún elemento (ese queda en tope)
    func popTo(where predicate: (Route) -> Bool, in tab: AppTab) {
        guard let stack = routes[tab],
              let idx = stack.lastIndex(where: predicate) else { return }
        routes[tab] = Array(stack.prefix(idx + 1))
    }
    
    /// Pop hasta una ruta específica (match completo)
    func popTo(_ route: Route, in tab: AppTab) {
        popTo(where: { $0 == route }, in: tab)
    }
}
