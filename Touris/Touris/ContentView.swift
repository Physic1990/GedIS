import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @ObservedObject var authViewModel = AuthViewModel()
    @State private var exploreVariable: String = "Hello from ExploreView"
    @State private var addToTripLocations: [Location] = []
    @StateObject private var postsViewModel = PostsViewModel()

    var body: some View {
        Group {
            if authViewModel.isSignedIn {
                MainView(addToTripLocations: addToTripLocations)
                    .environmentObject(postsViewModel)
            } else {
                SignInView(authViewModel: authViewModel)
            }
        }
        .onAppear {
            authViewModel.currentUserID = Auth.auth().currentUser?.uid
            authViewModel.isSignedIn = authViewModel.currentUserID != nil
        }
    }
}

struct MainView: View {
    @State private var exploreVariable: String = "Hello from ExploreView"
    @State var addToTripLocations: [Location] = []
    @EnvironmentObject var postsViewModel: PostsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView() // Include the header at the top
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Feed")
                    }
                CreatePostView()
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("Create Post")
                    }
                ExploreView(addToTripLocations: addToTripLocations, onAddToTrip: addLocation)
                    .tabItem {
                        Image(systemName: "mappin")
                        Text("Explore")
                    }
                MyTripView(exploreVariable: $exploreVariable, addToTripLocations: $addToTripLocations)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("My Trip")
                    }
            }
        }
    }
   
     
  
      private func addLocation(location: Location) {

            addToTripLocations.append(location)

            print("Added location: \(location.name)")

        }
     
}

