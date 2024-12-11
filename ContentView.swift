import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var cart: Cart
    
    @State
    private var currentView: String = "menu"
    
    @State
    private var selectedCoffee: Coffee? = nil

    var body: some View {
        VStack {
            if currentView == "menu" {
                CoffeeListView(
                    currentView: $currentView,
                    selectedCoffee: $selectedCoffee
                )
            } else if currentView == "detail" {
                CoffeeDetailView(
                    currentView: $currentView,
                    selectedCoffee: $selectedCoffee
                )
            } else if currentView == "cart" {
                OrderSummaryView(
                    currentView: $currentView
                )
            }
        }
        .environmentObject(cart)
    }
}
