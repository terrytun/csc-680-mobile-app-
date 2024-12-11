import SwiftUI

struct CoffeeDetailView: View {
    
    @Binding
    var currentView: String
    
    @Binding
    var selectedCoffee: Coffee?
    
    @EnvironmentObject
    var cart: Cart
    
    @State
    private var isHot: Bool = true

    var body: some View {
        if let coffee = selectedCoffee {
            VStack(spacing: 20) {
                Image(coffee.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)

                Text(coffee.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(coffee.description)
                    .font(.body)
                    .foregroundColor(.secondary)

                Text(coffee.price)
                    .font(.title)
                    .fontWeight(.semibold)

                Picker("Temperature", selection: $isHot) {
                    Text("Hot").tag(true)
                    Text("Iced").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Spacer()

                Button("Add to Cart") {
                    // Create a new coffee instance each time to avoid stacking tags
                    let newCoffee = Coffee(
                        name: coffee.name + (isHot ? " (Hot)" : " (Iced)"),
                        description: coffee.description,
                        price: coffee.price,
                        imageName: coffee.imageName
                    )
                    cart.add(newCoffee)
                    currentView = "menu"
                    selectedCoffee = nil
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Back to Menu") {
                    currentView = "menu"
                    selectedCoffee = nil
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
        } else {
            
            Text("No coffee selected.")
            Button("Back to Menu") {
                currentView = "menu"
            }
        }
    }
}
