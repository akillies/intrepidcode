//
//  QuoteView.swift
//  qotd
//
//  Created by Claude
//  Copyright © 2025 intrepidcode. All rights reserved.
//

import SwiftUI

struct QuoteView: View {
    @State private var currentQuote: Quote
    @State private var selectedCategory: QuoteCategory? = nil
    @State private var showingCategoryQuotes = false

    init() {
        _currentQuote = State(initialValue: QuoteManager.shared.getQuoteOfTheDay())
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 8) {
                        Text("Quote of the Day")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text("Daily wisdom for your journey")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)

                    // Main Quote Card
                    IOSQuoteCardView(quote: currentQuote)

                    // Category Grid
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Explore by Category")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 20)

                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            ForEach(QuoteCategory.allCases, id: \.self) { category in
                                NavigationLink(destination: IOSCategoryQuotesView(category: category)) {
                                    IOSCategoryCardView(category: category)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }

                    // Random Quote Button
                    Button(action: {
                        withAnimation(.spring()) {
                            currentQuote = QuoteManager.shared.getRandomQuote()
                        }
                    }) {
                        HStack {
                            Image(systemName: "shuffle")
                                .font(.headline)
                            Text("Get Random Quote")
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.purple, Color.pink]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 20)

                    Spacer(minLength: 40)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarHidden(true)
        }
    }
}

struct IOSQuoteCardView: View {
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
        VStack(alignment: .leading, spacing: 20) {
            // Category Badge
            HStack {
                Text(quote.category.rawValue.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(8)
                Spacer()
            }

            // Quote Text
            Text(quote.text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)

            // Author
            HStack {
                Spacer()
                Text("— \(quote.author)")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.95))
                    .italic()
            }
        }
        .padding(24)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .shadow(color: gradientColors[0].opacity(0.4), radius: 15, x: 0, y: 8)
        .padding(.horizontal, 20)
    }
}

struct IOSCategoryCardView: View {
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
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)

            Text(category.rawValue)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: gradientColors[0].opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct IOSCategoryQuotesView: View {
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
            LazyVStack(spacing: 20) {
                ForEach(quotes) { quote in
                    NavigationLink(destination: IOSQuoteDetailView(quote: quote)) {
                        IOSMiniQuoteCardView(quote: quote)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            quotes = QuoteManager.shared.getQuotes(for: category)
        }
    }
}

struct IOSMiniQuoteCardView: View {
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
            Text(quote.text)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(4)

            HStack {
                Spacer()
                Text("— \(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .italic()
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(color: gradientColors[0].opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct IOSQuoteDetailView: View {
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
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
                    Spacer(minLength: 60)

                    // Category Badge
                    Text(quote.category.rawValue.uppercased())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)

                    // Quote Text
                    Text(quote.text)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    // Author
                    Text("— \(quote.author)")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.95))
                        .italic()
                        .padding(.horizontal, 30)

                    Spacer(minLength: 60)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
