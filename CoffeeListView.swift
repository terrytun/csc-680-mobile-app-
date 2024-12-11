import SwiftUI

struct CoffeeListView: View {
    
    @Binding
    var currentView: String
    
    @Binding
    var selectedCoffee: Coffee?
    
    @EnvironmentObject
    var cart: Cart

    var body: some View {
        VStack {
            Text("Coffee Menu")
                .font(.largeTitle)
                .padding()

            List(coffeeMenu) { coffee in
                HStack {
                    Image(coffee.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(coffee.name)
                            .font(.headline)
                        Text(coffee.price)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Button("Details") {
                        selectedCoffee = coffee
                        currentView = "detail"
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }

            Spacer()

            Button(action: {
                currentView = "cart"
            }) {
                Text("Go to Cart (\(cart.items.count))")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
