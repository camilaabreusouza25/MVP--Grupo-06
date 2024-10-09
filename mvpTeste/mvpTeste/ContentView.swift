import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WelcomeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Digite seu nome", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Digite sua idade", text: $viewModel.age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Mostrar Mensagem") {
                viewModel.showWelcomeMessage()
            }
            
            Text(viewModel.welcomeMessage)
                .font(.headline)
                .padding()
        }
    }
}


final class WelcomeViewModel: ObservableObject, WelcomeViewProtocol {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var welcomeMessage: String = ""
    
    private var presenter: WelcomePresenter?
    
    init() {
        presenter = WelcomePresenter(view: self)
    }
    
    func showWelcomeMessage() {
        let ageInt = Int(age) ?? 0
        presenter?.updateNameAge(name, ageInt)
        presenter?.generateWelcomeMessage()
    }
    
   
    func updateWelcomeMessage(_ message: String) {
        welcomeMessage = message
    }
}
