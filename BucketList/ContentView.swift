//
//  ContentView.swift
//  BucketList
//
//  Created by Silver on 7/28/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    //writing a message
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    
                    //reading it straight away
                    let input = try String(contentsOf: url)
                    //and reading the version we saved to disk
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    //how we find users document directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
