//
//  ContentView.swift
//  BucketList
//
//  Created by Silver on 7/28/22.
//

import LocalAuthentication
import SwiftUI

//to run in simulator Feature-biometric enroll, then match

struct ContentView: View {
    // add states to add to SwiftUI
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    //authenticate method that isolates all the biometric functionality in a single place
    func authenticate() {
        //step 1 LAContext  (Local Authentication) _ lets us query users biometric status
        let context = LAContext()
        var error: NSError?
        
        //step 2 is our biometric authentication currently possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            //step 3 ask specifically - can i perform biometric authentication
            let reason = "We need to unlock your data"
            
            //step 4 passing in a closure of success or failure
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    //authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
