import SwiftUI

@main
struct CoffeeApp: App {
    
    @StateObject
    private var cart = Cart()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cart)
        }
    }
}
