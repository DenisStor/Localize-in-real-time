//
//  SwiftUIView.swift
//  work
//
//  Created by Денис Сторожев on 15.07.2023.
//

import SwiftUI

struct SwiftUIView: View {
    @AppStorage ("selected") var selectedLanguage = "en"
    
    var body: some View {
        Text("w")
            .environment(\.locale, .init(identifier: selectedLanguage))
            .onAppear(){
                func changeLanguage(to languageCode: String) {
                    selectedLanguage = languageCode
                    UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
                    UserDefaults.standard.synchronize()
                }
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
