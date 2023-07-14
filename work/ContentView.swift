import SwiftUI

struct SettingsView: View {
  @AppStorage ("selected") var selectedLanguage = "en"
  
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    SwiftUIView()
                } label: {
                  Text("Link")
                }
                Text("w") //ключ локализации
                    .font(.title)

                Button(action: {
                    self.showLanguageSelection()
                }) {
                    Text("Change Language")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(.infinity)
                }
            }
            .environment(\.locale, .init(identifier: selectedLanguage))
        }
    }

    func showLanguageSelection() {
        let alertController = UIAlertController(title: "Change Language", message: "Select a language", preferredStyle: .actionSheet)

        let englishAction = UIAlertAction(title: "English", style: .default) { _ in
            self.changeLanguage(to: "en")
        }
        alertController.addAction(englishAction)

        let spanishAction = UIAlertAction(title: "German", style: .default) { _ in
            self.changeLanguage(to: "de") //код языка
        }
        alertController.addAction(spanishAction)

        // еще языки добавите


        guard let windowScene = UIApplication.shared.windows.first?.windowScene else { //устаревший метод , если что поменяете
            return
        }


        let rootViewController = windowScene.windows.first?.rootViewController


        rootViewController?.present(alertController, animated: true, completion: nil)
    }

    func changeLanguage(to languageCode: String) {
        selectedLanguage = languageCode
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
