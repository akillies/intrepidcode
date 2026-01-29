# Daily Provocation - Session Context

## What We're Building
Transforming the existing "qotd" app into **Daily Provocation** with 45,000 quotes.

## Previous Session Summary
- ✅ Built complete iOS app with SwiftUI (in parent ../qotd/)
- ✅ Built Apple Watch app with complications (in parent ../qotd WatchKit Extension/)
- ✅ Created 45 sample quotes across 3 categories
- ✅ Implemented daily rotation algorithm
- ✅ Added category browsing and random quotes
- ✅ Updated Xcode project for iOS (ready to test)
- ✅ Created Watch setup instructions (WATCHKIT_SETUP.md)
- ✅ Pushed to GitHub: akillies/intrepidcode

## Current Session Goals

### 1. Analyze Quote Spreadsheet
**File**: Your 10MB .xls file with ~45,000 quotes from /Users/adminster/dailyprov/

**Questions to answer**:
- What columns exist?
- How is data structured?
- What categories/tags are used?
- Any data quality issues?

**Action**: Run `python3 analyze_quotes.py` after copying your .xls file here

### 2. Design Data Architecture
With 45K quotes, we need:
- Efficient storage (Core Data? SQLite? JSON?)
- Fast search/filtering
- Category indexing
- Memory optimization

### 3. Build Daily Provocation App
- Copy and rebrand from ../qotd/
- Integrate 45,000 quotes
- Add search functionality
- Enhance UI for "provocation" theme
- Update bundle IDs to com.intrepidcode.dailyprov

### 4. Add Advanced Features
- Quote search
- Favorites/bookmarks
- Share quotes
- Quote history
- Multiple quote formats

## Technical Decisions to Make

### Data Storage
**Option A: JSON File**
- ✅ Simple, portable
- ✅ Works with current code structure
- ❌ Large file size (~15-20MB)
- ❌ Must load all in memory

**Option B: Core Data**
- ✅ Efficient querying
- ✅ Memory efficient
- ✅ Supports search/filtering
- ❌ More complex setup

**Option C: SQLite**
- ✅ Very fast
- ✅ Excellent for large datasets
- ✅ Standard on iOS
- ❌ Requires SQL knowledge

**Recommendation**: Start with JSON for MVP, migrate to Core Data if needed

### Quote Model Enhancement
```swift
struct Quote: Identifiable, Codable {
    let id: UUID
    let text: String
    let author: String
    let category: QuoteCategory
    let source: String?        // NEW: Book, speech, etc.
    let tags: [String]?        // NEW: Keywords
    let year: Int?             // NEW: When said/written
    let rating: Int?           // NEW: Quality score
    let isFavorite: Bool       // NEW: User favorites
}
```

### Categories to Consider
Based on your 45K collection, we might have:
- Motivational
- Philosophical
- Zen/Mindfulness
- Business/Leadership
- Science/Technology
- Literature/Poetry
- Humor/Wit
- Life/Wisdom
- Love/Relationships
- Success/Achievement
- ... (whatever your spreadsheet has)

## File Checklist

When you copy your quotes file here, you should have:
```
dailyprov/
├── README.md                    ✅ Created
├── SESSION_CONTEXT.md           ✅ This file
├── analyze_quotes.py            ✅ Created
├── your-quotes-file.xls         ⏳ Copy from your Mac
└── TASKS.md                     ✅ Next to create
```

## Quick Start Commands

```bash
# Copy your quotes file
cp /Users/adminster/dailyprov/*.xls .

# Analyze the structure
python3 analyze_quotes.py

# Or if Python/pandas not available, convert to CSV:
# Open in Excel → Save As → CSV, then:
head -20 your-quotes.csv
wc -l your-quotes.csv
```

## Connection to Parent Project

The working app code is in the parent directory:
```bash
# iOS app
ls ../qotd/
  - AppDelegate.swift
  - Quote.swift (45 sample quotes)
  - QuoteView.swift (SwiftUI UI)

# Watch app
ls "../qotd WatchKit Extension/"
  - QOTDApp.swift
  - ContentView.swift
  - ComplicationController.swift

# Documentation
ls ../*.md
  - README.md (full documentation)
  - WATCHKIT_SETUP.md (Watch setup guide)
```

## What Claude Code Should Do First

1. **Greet and confirm**: "I see you're in the dailyprov folder. Do you have the .xls file here?"

2. **Analyze spreadsheet**: Once file is available, run analysis

3. **Show findings**: Present structure and ask about priorities

4. **Plan architecture**: Recommend data structure based on findings

5. **Start building**: Copy and rebrand app with new quote data

## Important Context

- **Company**: intrepidcode (registered with Apple)
- **Original bundle ID**: intrepid.qotd
- **New bundle ID**: com.intrepidcode.dailyprov
- **Platforms**: iOS 14.0+, watchOS 7.0+
- **Language**: Swift 5.0
- **UI Framework**: SwiftUI
- **GitHub**: https://github.com/akillies/intrepidcode

## Theme: "Daily Provocation"

Unlike generic quote apps, "provocation" suggests:
- Thought-provoking content
- Challenges conventional thinking
- Sparks conversation
- Pushes boundaries
- Inspires action

The UI should reflect this - bold, striking, engaging.

---

**Ready to build something amazing with 45,000 quotes!** 🎯
