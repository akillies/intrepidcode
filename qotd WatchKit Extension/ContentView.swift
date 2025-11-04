//
//  ContentView.swift
//  qotd WatchKit Extension
//
//  Created by Claude
//  Copyright © 2025 intrepidcode. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var currentQuote: Quote
    @State private var showingDetail = false
    @State private var selectedCategory: QuoteCategory? = nil

    init() {
        _currentQuote = State(initialValue: QuoteManager.shared.getQuoteOfTheDay())
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    Text("Quote of the Day")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    // Quote Card
                    QuoteCardView(quote: currentQuote)
                        .onTapGesture {
                            showingDetail = true
                        }

                    // Category Buttons
                    VStack(spacing: 12) {
                        Text("Explore")
                            .font(.caption)
                            .foregroundColor(.gray)

                        ForEach(QuoteCategory.allCases, id: \.self) { category in
                            NavigationLink(destination: CategoryQuotesView(category: category)) {
                                CategoryButtonView(category: category)
                            }
                        }

                        // Random Quote Button
                        Button(action: {
                            withAnimation(.spring()) {
                                currentQuote = QuoteManager.shared.getRandomQuote()
                            }
                        }) {
                            HStack {
                                Image(systemName: "shuffle")
                                Text("Random Quote")
                            }
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.purple, Color.pink]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(20)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }
            .background(Color.black)
        }
        .sheet(isPresented: $showingDetail) {
            QuoteDetailView(quote: currentQuote)
        }
    }
}

struct QuoteCardView: View {
    let quote: Quote

    var gradientColors: [Color] {
        switch quote.category {
        case .motivational:
            return [Color.orange, Color.red]
        case .philosophical:
            return [Color.blue, Color.purple]
        case .zen:
            return [Color.green, Color.teal]
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Category Badge
            Text(quote.category.rawValue.uppercased())
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.2))
                .cornerRadius(8)

            // Quote Text
            Text(quote.text)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)

            // Author
            HStack {
                Spacer()
                Text("— \(quote.author)")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))
                    .italic()
            }
        }
        .padding(16)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: gradientColors[0].opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct CategoryButtonView: View {
    let category: QuoteCategory

    var gradientColors: [Color] {
        switch category {
        case .motivational:
            return [Color.orange, Color.red]
        case .philosophical:
            return [Color.blue, Color.purple]
        case .zen:
            return [Color.green, Color.teal]
        }
    }

    var icon: String {
        switch category {
        case .motivational:
            return "flame.fill"
        case .philosophical:
            return "brain.head.profile"
        case .zen:
            return "leaf.fill"
        }
    }

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(category.rawValue)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .font(.caption)
        .foregroundColor(.white)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(20)
    }
}

struct QuoteDetailView: View {
    let quote: Quote
    @Environment(\.presentationMode) var presentationMode

    var gradientColors: [Color] {
        switch quote.category {
        case .motivational:
            return [Color.orange, Color.red]
        case .philosophical:
            return [Color.blue, Color.purple]
        case .zen:
            return [Color.green, Color.teal]
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Category Badge
                Text(quote.category.rawValue.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)

                // Quote Text
                Text(quote.text)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.vertical, 20)

                // Author
                Text("— \(quote.author)")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.9))
                    .italic()

                Spacer()

                // Close Button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
    }
}

struct CategoryQuotesView: View {
    let category: QuoteCategory
    @State private var quotes: [Quote] = []

    var gradientColors: [Color] {
        switch category {
        case .motivational:
            return [Color.orange, Color.red]
        case .philosophical:
            return [Color.blue, Color.purple]
        case .zen:
            return [Color.green, Color.teal]
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(quotes) { quote in
                    NavigationLink(destination: QuoteDetailView(quote: quote)) {
                        MiniQuoteCardView(quote: quote)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .background(Color.black)
        .navigationTitle(category.rawValue)
        .onAppear {
            quotes = QuoteManager.shared.getQuotes(for: category)
        }
    }
}

struct MiniQuoteCardView: View {
    let quote: Quote

    var gradientColors: [Color] {
        switch quote.category {
        case .motivational:
            return [Color.orange, Color.red]
        case .philosophical:
            return [Color.blue, Color.purple]
        case .zen:
            return [Color.green, Color.teal]
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quote.text)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(3)

            HStack {
                Spacer()
                Text("— \(quote.author)")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))
                    .italic()
            }
        }
        .padding(12)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
