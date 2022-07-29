//
//  ContentView.swift
//  BucketList
//
//  Created by Silver on 7/28/22.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    var loadingState = LoadingState.loading
    
    var body: some View {
        // or can be a switch statement too
        //switch loadingState {
        //case .loading:
        //  LoadingView()
        //case .success:
        //  SuccessView()
        //case .failed:
        //  FailedView()
        
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
