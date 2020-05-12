//
//  ContentView.swift
//  LoginAuthentication
//
//  Created by Al Amin on 11/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    @State private var alert = false
    @State private var error = ""
    var body: some View {
        NavigationView {
            ZStack {
                ZStack{
                    NavigationLink(destination: Signup(show: $show), isActive: self.$show) {
                        Text("")
                    }
                    .hidden()
                    Login(show: self.$show, alert: self.$alert, error: self.$error)
                   // ErrorView(alert: $alert, error: $error)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
                if self.alert {
                    ErrorView(alert: $alert, error: $error)
                }
            }
        }
        
        
        
        // Signup()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login: View {
    @State private var color = Color.black.opacity(0.7)
    @State private var email = ""
    @State private var pass = ""
    @State private var visible = false
    @Binding var show:Bool
    @Binding var alert: Bool
    @Binding var error: String
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            GeometryReader { geometry in
                VStack{
                    Image("logo")
                        .renderingMode(.original)
                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 35)
                    TextField("Enter email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                    
                    HStack{
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                                
                                
                            }else{
                                SecureField("Password", text: self.$pass)
                                
                            }
                            
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye" : "eye.slash")
                                
                                .foregroundColor(self.color)
                            
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    HStack {
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Forget Password")
                                .foregroundColor(Color("Color"))
                                .fontWeight(.semibold)
                        }
                        
                    }
                    .padding(.top, 15)
                    
                    Button(action: {
                        self.verify()
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                }
                .padding(.horizontal, 25)
            }
            Button(action:{
                self.show.toggle()
            }) {
                    Text("Register")
                        .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
                }
            .padding()
            
        }
    }
    func verify() {
        if self.email == "" || self.pass == "" {
            self.error = "Please fill up all the contents properly"
            self.alert.toggle()
        }
    }
}

struct Signup: View {
    @State private var color = Color.black.opacity(0.7)
    @State private var email = ""
    @State private var pass = ""
    @State private var repass = ""
    @State private var visible = false
    @State private var revisible = false
    @Binding var show:Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            GeometryReader { geometry in
                VStack{
                    Image("logo")
                        .renderingMode(.original)
                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 35)
                    TextField("Enter email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                    
                    HStack{
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                                
                                
                            }else{
                                SecureField("Password", text: self.$pass)
                                
                            }
                            
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye" : "eye.slash")
                                
                                .foregroundColor(self.color)
                            
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    HStack{
                        VStack{
                            if self.revisible {
                                TextField("Re-Password", text: self.$repass)
                                
                                
                            }else{
                                SecureField("Re-Password", text: self.$repass)
                                
                            }
                            
                        }
                        
                        Button(action: {
                            self.revisible.toggle()
                        }) {
                            Image(systemName: self.revisible ? "eye" : "eye.slash")
                                
                                .foregroundColor(self.color)
                            
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Register")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                }
                .padding(.horizontal, 25)
            }
            Button(action: {
                self.show.toggle()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("Color"))
            }
            .padding()
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ErrorView: View {
    @State private var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text("Error")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(self.color)
                    Spacer()
                    
                }
                .padding(.horizontal, 25)
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
