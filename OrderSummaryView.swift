import SwiftUI

struct OrderSummaryView: View {
    
    @Binding
    var currentView: String
    
    @EnvironmentObject
    var cart: Cart

    var body: some View {
        VStack {
            Text("Order Summary")
                .font(.largeTitle)
                .padding()

            if cart.items.isEmpty {
                Text("Your cart is empty.")
                    .font(.title)
                    .padding()

                Button("Back to Menu") {
                    currentView = "menu"
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

            } else {
                List(cart.items) { coffee in
                    HStack {
                        Image(coffee.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)

                        Text(coffee.name)
                            .font(.headline)

                        Spacer()

                        Text(coffee.price)
                            .font(.body)
                            .foregroundColor(.green)
                    }
                }

                Text("Total: $\(String(format: "%.2f", cart.totalPrice()))")
                    .font(.title)
                    .padding()

                Button("Place Order") {
                    cart.clear()
                    currentView = "menu"
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()

                Button("Back to Menu") {
                    currentView = "menu"
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}
