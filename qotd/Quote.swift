//
//  Quote.swift
//  qotd WatchKit Extension
//
//  Created by Claude
//  Copyright © 2025 intrepidcode. All rights reserved.
//

import Foundation

struct Quote: Identifiable, Codable {
    let id: UUID
    let text: String
    let author: String
    let category: QuoteCategory

    init(text: String, author: String, category: QuoteCategory) {
        self.id = UUID()
        self.text = text
        self.author = author
        self.category = category
    }
}

enum QuoteCategory: String, Codable, CaseIterable {
    case motivational = "Motivational"
    case philosophical = "Philosophical"
    case zen = "Zen"
}

class QuoteManager {
    static let shared = QuoteManager()

    private init() {}

    let quotes: [Quote] = [
        // Zen Quotes
        Quote(text: "The obstacle is the path.", author: "Zen Proverb", category: .zen),
        Quote(text: "Let go or be dragged.", author: "Zen Saying", category: .zen),
        Quote(text: "The quieter you become, the more you can hear.", author: "Ram Dass", category: .zen),
        Quote(text: "Before enlightenment: chop wood, carry water. After enlightenment: chop wood, carry water.", author: "Zen Proverb", category: .zen),
        Quote(text: "You cannot travel the path until you have become the path itself.", author: "Buddha", category: .zen),
        Quote(text: "When walking, walk. When eating, eat.", author: "Zen Proverb", category: .zen),
        Quote(text: "The present moment is the only time over which we have dominion.", author: "Thích Nhất Hạnh", category: .zen),
        Quote(text: "Sitting quietly, doing nothing, spring comes, and the grass grows by itself.", author: "Zen Poem", category: .zen),
        Quote(text: "If you understand, things are just as they are. If you do not understand, things are just as they are.", author: "Zen Proverb", category: .zen),
        Quote(text: "Empty your cup so that it may be filled.", author: "Bruce Lee", category: .zen),

        // Philosophical Quotes
        Quote(text: "The unexamined life is not worth living.", author: "Socrates", category: .philosophical),
        Quote(text: "I think, therefore I am.", author: "René Descartes", category: .philosophical),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson", category: .philosophical),
        Quote(text: "He who has a why to live can bear almost any how.", author: "Friedrich Nietzsche", category: .philosophical),
        Quote(text: "The only way to deal with an unfree world is to become so absolutely free that your very existence is an act of rebellion.", author: "Albert Camus", category: .philosophical),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act but a habit.", author: "Aristotle", category: .philosophical),
        Quote(text: "The only true wisdom is in knowing you know nothing.", author: "Socrates", category: .philosophical),
        Quote(text: "To live is to suffer, to survive is to find some meaning in the suffering.", author: "Friedrich Nietzsche", category: .philosophical),
        Quote(text: "Man is condemned to be free.", author: "Jean-Paul Sartre", category: .philosophical),
        Quote(text: "Happiness is not an ideal of reason, but of imagination.", author: "Immanuel Kant", category: .philosophical),

        // Motivational Quotes
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins", category: .motivational),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs", category: .motivational),
        Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt", category: .motivational),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot", category: .motivational),
        Quote(text: "Everything you've ever wanted is on the other side of fear.", author: "George Addair", category: .motivational),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt", category: .motivational),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson", category: .motivational),
        Quote(text: "Start where you are. Use what you have. Do what you can.", author: "Arthur Ashe", category: .motivational),
        Quote(text: "Success is not final, failure is not fatal: it is the courage to continue that counts.", author: "Winston Churchill", category: .motivational),
        Quote(text: "Don't watch the clock; do what it does. Keep going.", author: "Sam Levenson", category: .motivational),
        Quote(text: "The best time to plant a tree was 20 years ago. The second best time is now.", author: "Chinese Proverb", category: .motivational),
        Quote(text: "You miss 100% of the shots you don't take.", author: "Wayne Gretzky", category: .motivational),
        Quote(text: "Whether you think you can or you think you can't, you're right.", author: "Henry Ford", category: .motivational),
        Quote(text: "The two most important days in your life are the day you are born and the day you find out why.", author: "Mark Twain", category: .motivational),
        Quote(text: "Life is 10% what happens to you and 90% how you react to it.", author: "Charles R. Swindoll", category: .motivational),

        // More Zen Quotes
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha", category: .zen),
        Quote(text: "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.", author: "Buddha", category: .zen),
        Quote(text: "Peace comes from within. Do not seek it without.", author: "Buddha", category: .zen),
        Quote(text: "Wherever you are, be all there.", author: "Jim Elliot", category: .zen),
        Quote(text: "Simplicity is the ultimate sophistication.", author: "Leonardo da Vinci", category: .zen),

        // More Philosophical Quotes
        Quote(text: "In the middle of difficulty lies opportunity.", author: "Albert Einstein", category: .philosophical),
        Quote(text: "Life must be understood backward, but it must be lived forward.", author: "Søren Kierkegaard", category: .philosophical),
        Quote(text: "The path to enlightenment is not a path at all, it's actually a metaphor for the time it takes for you to allow yourself to be happy.", author: "Marty Rubin", category: .philosophical),
        Quote(text: "What we think, we become.", author: "Buddha", category: .philosophical),
        Quote(text: "The meaning of life is to find your gift. The purpose of life is to give it away.", author: "Pablo Picasso", category: .philosophical),
    ]

    func getQuoteOfTheDay() -> Quote {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let daysSince1970 = Int(today.timeIntervalSince1970 / 86400)
        let index = daysSince1970 % quotes.count
        return quotes[index]
    }

    func getRandomQuote() -> Quote {
        return quotes.randomElement() ?? quotes[0]
    }

    func getQuotes(for category: QuoteCategory) -> [Quote] {
        return quotes.filter { $0.category == category }
    }
}
