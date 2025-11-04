# Quote of the Day - Apple Watch & iOS App

**"the mind wakes"** - A beautiful daily companion for inspiration and reflection.

## Overview

Quote of the Day is a stunning Apple Watch and iOS app that delivers daily doses of wisdom through carefully curated motivational, philosophical, and zen quotes. Built with modern SwiftUI, the app features beautiful gradient interfaces and seamless Watch face integration.

## Features

### Apple Watch App
- **Daily Quote of the Day**: Automatically rotates based on the date for a fresh quote each day
- **Beautiful Gradients**: Color-coded by category with smooth, eye-catching gradients
  - 🔥 Motivational (Orange/Red)
  - 🧠 Philosophical (Blue/Purple)
  - 🍃 Zen (Green/Teal)
- **Category Browsing**: Explore quotes by category
- **Random Quotes**: Shuffle for instant inspiration
- **Watch Face Complications**: Display quotes directly on your watch face
  - Supports all complication families
  - Updates automatically with the daily quote

### iOS Companion App
- **Synchronized Experience**: Same beautiful design language as the Watch app
- **Large Screen Layout**: Optimized for iPhone and iPad
- **Category Grid**: Browse quotes organized by wisdom type
- **Detailed Views**: Full-screen quote presentations with elegant gradients
- **Random Quote Generator**: Get instant inspiration with a tap

## Quote Collection

The app includes 45+ carefully selected quotes across three categories:

### Zen Quotes
Featuring wisdom from Buddha, Thích Nhất Hạnh, and classic Zen proverbs focused on mindfulness, presence, and simplicity.

### Philosophical Quotes
Insights from great thinkers like Socrates, Nietzsche, Descartes, Sartre, and more, exploring life's deeper meanings.

### Motivational Quotes
Empowering messages from leaders and visionaries including Steve Jobs, Theodore Roosevelt, Winston Churchill, and others.

## Technical Details

### Architecture
- **Language**: Swift 5+
- **UI Framework**: SwiftUI
- **Minimum iOS**: iOS 14.0+
- **Minimum watchOS**: watchOS 7.0+
- **Pattern**: MVVM with Singleton pattern for quote management

### Key Components

#### Quote Model
```swift
struct Quote: Identifiable, Codable {
    let id: UUID
    let text: String
    let author: String
    let category: QuoteCategory
}
```

#### Quote Manager
- Singleton instance for centralized quote management
- Date-based algorithm ensures consistent daily quotes
- Category filtering and random selection support

#### Daily Quote Algorithm
Uses calendar-based calculation to ensure the same quote appears for all users on any given day:
```swift
let daysSince1970 = Int(today.timeIntervalSince1970 / 86400)
let index = daysSince1970 % quotes.count
```

### File Structure
```
qotd/
├── Quote.swift                 # Shared quote model and manager
├── QuoteView.swift            # iOS SwiftUI views
├── AppDelegate.swift          # iOS app entry point
└── Assets.xcassets/           # iOS app icons

qotd WatchKit Extension/
├── QOTDApp.swift              # Watch app entry point
├── Quote.swift                # Quote model and manager
├── ContentView.swift          # Watch SwiftUI views
├── ComplicationController.swift # Watch face complications
├── Info.plist                 # Watch extension configuration
└── Assets.xcassets/           # Watch app icons
```

## Design Philosophy

The app embraces several key design principles:

1. **Minimalism**: Clean, distraction-free interface lets the wisdom shine
2. **Beauty**: Gradient backgrounds create visual appeal without overwhelming
3. **Consistency**: Daily quotes remain stable across app restarts
4. **Accessibility**: SwiftUI ensures proper dynamic type and accessibility support
5. **Performance**: Efficient algorithms and native SwiftUI for smooth operation

## Installation

1. Open `qotd.xcodeproj` in Xcode
2. Select your target device (iPhone Simulator or Apple Watch Simulator)
3. Build and run (⌘R)

### Requirements
- Xcode 13.0+
- iOS 14.0+ / watchOS 7.0+
- SwiftUI support

## Usage

### Daily Quote
The app automatically selects a quote based on the current date. Simply open the app to see today's wisdom.

### Browse by Category
Tap any category card to explore all quotes in that theme:
- Motivational quotes to energize and inspire
- Philosophical quotes to provoke thought
- Zen quotes for mindfulness and peace

### Random Quote
Tap the "Shuffle" or "Get Random Quote" button for instant inspiration from any category.

### Watch Complications
1. Long-press your watch face
2. Tap "Edit" then select a complication slot
3. Scroll to "Quote of the Day"
4. Choose your preferred complication style

## Future Enhancements

Potential additions for future versions:
- [ ] Quote favorites and bookmarking
- [ ] Share quotes to social media
- [ ] Custom quote categories
- [ ] User-submitted quotes
- [ ] Widget support for iOS home screen
- [ ] Notification reminders
- [ ] Multi-language support
- [ ] Dark/Light theme customization

## Credits

**Developer**: intrepidcode
**Design**: SwiftUI with custom gradients
**Quotes**: Public domain and attributed sources

## License

Copyright © 2025 intrepidcode. All rights reserved.

---

*"The quieter you become, the more you can hear."* - Ram Dass
