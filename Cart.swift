import SwiftUI

class Cart: ObservableObject {
    
    @Published
    var items: [Coffee] = []

    func add(_ coffee: Coffee) {
        items.append(coffee)
    }

    func totalPrice() -> Double {
        items.reduce(0) { total, coffee in
            total + (Double(coffee.price.dropFirst()) ?? 0)
        }
    }

    func clear() {
        items.removeAll()
    }
}
