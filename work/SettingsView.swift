import SwiftUI

struct SettingsView: View {
  @AppStorage ("selected") var selectedLanguage = "en"
  
    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                NavigationLink {
                    SecondRandomView()
                } label: {
                    Text("Переход в новое окно")
                }
                Text("w") //ключ локализации
                    .font(.title)
                HStack{
                    Button(action: {
                        selectedLanguage = "en"
                        changeLanguage(to: selectedLanguage)
                    }) {
                        Text("изменить язык на EN")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(.infinity)
                    }
                    Button(action: {
                        selectedLanguage = "de"
                        changeLanguage(to: selectedLanguage)
                    }) {
                        Text("изменить язык на DE")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(.infinity)
                    }
                }
            }
            .environment(\.locale, .init(identifier: selectedLanguage))
        }
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
