//
//  LoginView.swift
//  LearnSUI
//
//  Created by Виктор Поволоцкий on 08.07.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var login: String = ""
    @State var isLoginPressed: Bool = false
    
    var body: some View {
        VStack {
            makeHeaderButton()
            makeHeaderSection()
            Spacer()
            makeCodeButton()
            makeMiddleTextDivider()
            makeEntryButton()
            Spacer()
            makeEmailEntryButton()
        }
        .padding(16)
    }
}

extension LoginView {
    fileprivate func makeHeaderButton() -> some View {
        return HStack{
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    fileprivate func makeHeaderSection() -> some View {
        Text("Вход или регистрация")
            .font(.system(size: 20).bold())
        TextField("Телефон", text: $login)
            .padding(16)
            .background(Color.init(.sRGB, red: 0.93, green: 0.95, blue: 0.97, opacity: 1))
            .cornerRadius(10)
    }
    
    fileprivate func makeCodeButton() -> some View {
        return Button {
            if isLoginPressed {
                isLoginPressed = false
            } else {
                isLoginPressed = true
            }
        } label: {
            Text("Получить код")
                .foregroundColor(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                .background(isLoginPressed ? Color.green : Color.blue)
                .cornerRadius(10)
        }
    }
    
    fileprivate func makeMiddleTextDivider() -> some View {
        return HStack{
            VStack{
                Divider().frame(width: 64)
            }
            Text("Или")
                .foregroundColor(Color.gray)
            VStack{
                Divider().frame(width: 64)
            }
        }
    }
    
    fileprivate func makeEntryButton() -> some View {
        return Button {
            //
        } label: {
            HStack {
                Image(systemName: "applelogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                Text("Вход c Apple")
            }
            .foregroundColor(Color.white)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
            .background(Color.black)
            .cornerRadius(10)
        }
    }
    
    fileprivate func makeEmailEntryButton() -> some View {
        Link(destination: URL(filePath: "mailto://support@ozon.ru")) {
            Text("Войти по почте")
                .font(.system(size: 16).bold())
                .padding()
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
