# Daily Provocation - Quote of the Day App

## Project Overview

**Daily Provocation** is a beautiful Apple Watch & iOS app that delivers daily wisdom through curated quotes. This is a rebrand/evolution of the original "qotd" (Quote of the Day) project.

### Company Info
- **Developer**: intrepidcode (registered with Apple)
- **Bundle ID**: `com.intrepidcode.dailyprov` (or `intrepid.dailyprov`)
- **Original Project**: akillies/intrepidcode on GitHub

## Current Status

### What Exists
The original `qotd` app has been built with:
- ✅ Modern SwiftUI architecture
- ✅ iOS app with beautiful gradient UI
- ✅ Apple Watch app with complications support
- ✅ 45 curated quotes across 3 categories (Motivational, Philosophical, Zen)
- ✅ Daily quote rotation algorithm
- ✅ Category browsing and random quote features

**Location**: Parent directory has complete working code in `qotd/` and `qotd WatchKit Extension/`

### What's Next
Transform this into **Daily Provocation** with:
- 🎯 **45,000 quotes** from original spreadsheet collection
- 🎨 New branding and name: "Daily Provocation"
- 📊 Enhanced categorization
- 🔍 Search and filtering capabilities
- ⭐ Favorites/bookmarking system
- 📱 Modern iOS 17+ / watchOS 10+ features

## Your Quote Collection

### File Details
- **Location**: `/Users/adminster/dailyprov/` (on your Mac)
- **Format**: .xls (10MB Excel file)
- **Content**: ~45,000 quotes from when you first started this idea years ago

### What We Need to Do
1. **Analyze the spreadsheet structure**
   - What columns exist? (Quote, Author, Category, Source, Tags, etc.)
   - How are quotes organized?
   - Any duplicates or data cleaning needed?

2. **Extract and categorize**
   - Parse all 45,000 quotes
   - Map to categories (or create new ones)
   - Clean/normalize data

3. **Integrate into app**
   - Update Quote.swift model if needed
   - Create efficient data structure (JSON, Core Data, SQLite?)
   - Handle large dataset performance

4. **Enhance features**
   - Search functionality
   - Category filtering
   - Quote favorites
   - Sharing capabilities

## Next Steps

### Immediate Tasks
1. ✅ **Analyze the .xls file**
   ```bash
   # First, let's see what we have
   # Show me the structure of your quotes file
   ```

2. **Convert and clean data**
   - Export to CSV or parse directly
   - Remove duplicates
   - Standardize format

3. **Design data architecture**
   - How to store 45K quotes efficiently?
   - Local database vs JSON?
   - Quote indexing for search

4. **Rebuild as "Daily Provocation"**
   - Copy app structure from parent qotd/ folder
   - Rename bundle IDs
   - Update branding

### Technical Stack
- **Language**: Swift 5.0+
- **UI**: SwiftUI
- **Data**: Core Data or JSON (TBD based on needs)
- **Platforms**: iOS 14.0+, watchOS 7.0+
- **Architecture**: MVVM

## File Structure (Planned)

```
dailyprov/
├── README.md                          # This file
├── quotes-raw.xls                     # Your original spreadsheet
├── quotes-processed.json              # Cleaned quote data
├── DailyProv/                         # iOS app
│   ├── Quote.swift                    # Quote model
│   ├── QuoteManager.swift             # Data management
│   ├── QuoteView.swift                # Main UI
│   └── ...
├── DailyProv WatchKit Extension/      # Watch app
│   ├── ContentView.swift
│   ├── ComplicationController.swift
│   └── ...
└── DailyProv.xcodeproj/              # Xcode project
```

## Quick Commands

### Analyze Your Spreadsheet
Once you have the .xls file here:
```bash
# If you have Python/pandas:
python3 -c "import pandas as pd; df = pd.read_excel('your-file.xls'); print(df.head()); print(df.columns)"

# Or convert to CSV first:
# Open in Excel → Save As → CSV
```

### Start Fresh App
```bash
# Copy structure from parent
cp -r ../qotd ./DailyProv
cp -r "../qotd WatchKit Extension" "./DailyProv WatchKit Extension"
# Then rename/rebrand
```

## Questions to Answer

When starting the new Claude Code session, help answer:

1. **What columns are in your spreadsheet?**
   - Quote text
   - Author
   - Category/Tags
   - Source/Attribution
   - Date added?
   - Rating/Quality score?

2. **How are categories organized?**
   - Predefined categories?
   - Tags/keywords?
   - Multiple categories per quote?

3. **Data quality?**
   - Any duplicates?
   - Missing authors?
   - Formatting issues?

4. **App priorities?**
   - Focus on Watch or iOS first?
   - What features are must-haves?
   - Any unique "provocation" features?

## Resources

- **GitHub**: https://github.com/akillies/intrepidcode
- **Parent Project**: `../qotd/` (working iOS app)
- **Parent Watch App**: `../qotd WatchKit Extension/` (working Watch app)
- **Documentation**: `../README.md` and `../WATCHKIT_SETUP.md`

## Getting Started

When you start Claude Code in this folder:

1. **First command**: Show me what's in your quotes spreadsheet
2. **Second**: Let's analyze and clean the data
3. **Third**: Design the new app architecture
4. **Then**: Build Daily Provocation!

---

**Ready to transform 45,000 quotes into a beautiful daily wisdom app!** 🚀
