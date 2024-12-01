//
//  ContentView.swift
//  NavigationFreeze
//
//  Created by Sami Samhuri on 2024-12-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: RecipesView()) {
                    Label("Show Recipes (freezes)", systemImage: "books.vertical")
                        .padding(.vertical)
                }

                NavigationLink(destination: RecipesViewWithoutOpenURL()) {
                    Label("Show Recipes (no freeze)", systemImage: "books.vertical")
                        .padding(.vertical)
                }

                NavigationLink(destination: RecipesViewWithInlineDestination()) {
                    Label("Show Recipes (also no freeze)", systemImage: "books.vertical")
                        .padding(.vertical)
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct RecipesView: View {
    // This only happens when we have openURL in the environment.
    @Environment(\.openURL) private var openURL

    var body: some View {
        // Changing this to an inline view expression also makes it work for some reason.
        NavigationLink(destination: recipeView) {
            Text("Mom's Secret Pasta Sauce (will freeze)")
                .padding(.vertical)
        }
        .buttonStyle(.borderedProminent)
    }

    private var recipeView: some View {
        Text("<insert recipe here>")
    }
}

struct RecipesViewWithoutOpenURL: View {
    var body: some View {
        NavigationLink(destination: recipeView) {
            Text("Mom's Secret Pasta Sauce (will not freeze)")
                .padding(.vertical)
        }
        .buttonStyle(.borderedProminent)
    }

    private var recipeView: some View {
        Text("<insert recipe here>")
    }
}

struct RecipesViewWithInlineDestination: View {
    // This only happens when we have openURL in the environment.
    @Environment(\.openURL) private var openURL

    var body: some View {
        NavigationLink(destination: Text("<insert recipe here>")) {
            Text("Mom's Secret Pasta Sauce (will not freeze)")
                .padding(.vertical)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
