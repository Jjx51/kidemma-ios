//
//  TabBarView.swift
//  com.kidemma
//
//  Created by leonardo.hernandez on 10/02/26.
//

import SwiftUI
struct TabBarView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView().tabItem {
                Image(
                    selectedTab == .home
                    ? "ic_admin_home_active"
                    : "ic_admin_home"
                )
                Text("Inicio")
            }
            .tag(Tab.home)
            .toolbarBackground(.white, for: .tabBar) // Fondo de la pestaña
            .toolbarBackground(.visible, for: .tabBar) // Hacer visible en iOS 16+
            
            KidsView().tabItem {
                Image(
                    selectedTab == .kids
                    ? "ic_kids_active"
                    : "ic_kids"
                )
                Text("Niños")
            }
            .tag(Tab.kids)
            .toolbarBackground(.white, for: .tabBar) // 1. Cambia el color
            .toolbarBackground(.visible, for: .tabBar)
            DateBookView().tabItem {
                Image(
                    selectedTab == .dateBook
                    ? "ic_schedule_active"
                    : "ic_schedule"
                )
                Text("Agenda")
            }
            .tag(Tab.dateBook)
            .toolbarBackground(.white, for: .tabBar) // 1. Cambia el color
            .toolbarBackground(.visible, for: .tabBar)
            FamilyView().tabItem {
                Image(
                    selectedTab == .family
                    ? "ic_families_active"
                    : "ic_families"
                )
                Text("Familias")
            }
            .tag(Tab.family)
            .toolbarBackground(.white, for: .tabBar) // 1. Cambia el color
            .toolbarBackground(.visible, for: .tabBar)
            OtherView().tabItem {
                Image(
                    selectedTab == .other
                    ? "ic_admin_others_active"
                    : "ic_admin_others"
                )
                Text("Otros")
            }
            .tag(Tab.other)
            .toolbarBackground(.white, for: .tabBar) // 1. Cambia el color
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(Color("IconColor"))
    }
}
enum Tab : Hashable { case home
    case kids
    case dateBook
    case family
    case other
}
struct HomeView: View {
    var body: some View {
        VStack{
            TopBar()
            AdminHome()
        }
        
    }
}

struct KidsView: View {
    var body: some View {
        VStack{
            TopBar()
            Spacer()
            Text("Niños")
            Spacer()
        }
    }
}

struct DateBookView: View {
    var body: some View {
        VStack{
            TopBar()
            Spacer()
            Text("Agenda")
            Spacer()
        }
    }
}

struct FamilyView: View {
    var body: some View {
        VStack{
            TopBar()
            Spacer()
            Text("Familias")
            Spacer()
        }
    }
}

struct OtherView: View {
    var body: some View {
        VStack{
            TopBar()
            OthersScreen()
        }
    }
}

#Preview { TabBarView() }
