
import Foundation

protocol WelcomeViewProtocol: AnyObject {
    func updateWelcomeMessage(_ message: String)
}

class WelcomePresenter {
    private var user: User
    weak var view: WelcomeViewProtocol?

    init(view: WelcomeViewProtocol) {
        self.user = User(name: "", age: 1)
        self.view = view
    }

    func updateNameAge(_ name: String, _ age: Int) {
        user.name = name
        user.age = age
    }

    func generateWelcomeMessage() {
        let message = "Bem-vindo, \(user.name). Você tem \(user.age) anos de idade!"
        view?.updateWelcomeMessage(message)
    }
}
