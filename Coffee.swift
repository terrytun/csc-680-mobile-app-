import Foundation

class Coffee: Identifiable {
    let id = UUID()
    var name: String
    let description: String
    let price: String
    let imageName: String

    init(name: String, description: String, price: String, imageName: String) {
        self.name = name
        self.description = description
        self.price = price
        self.imageName = imageName
    }
}

let coffeeMenu = [
    Coffee(name: "Espresso", description: "Rich and bold espresso", price: "$3.05", imageName: "espresso"),
        Coffee(name: "Latte", description: "Smooth and creamy latte", price: "$5.50", imageName: "latte"),
        Coffee(name: "Cappuccino", description: "Frothy cappuccino with heart", price: "$5.00", imageName: "cappuccino"),
        Coffee(name: "Mocha", description: "Chocolatey mocha delight", price: "$5.75", imageName: "mocha latte"),
        Coffee(name: "Caramel", description: "sweet and caramel delight", price: "$5.75", imageName: "Caramel latte"),
        Coffee(name: "Vanilla", description: "sweet and Vanilla", price: "$5.75", imageName: "Vanilla latte"),
        Coffee(name: "Pumpkin", description: "yummy season pumpkin", price: "$5.75", imageName: "pumpkin latte"),
    ]
