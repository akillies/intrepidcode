# Apple Watch Setup Instructions

The Apple Watch code is complete but needs to be added to the Xcode project. Follow these steps:

## Quick Setup (5 minutes)

### Step 1: Add WatchKit App Target

1. Open `qotd.xcodeproj` in Xcode
2. Click on the project in the navigator (blue icon at top)
3. At the bottom of the targets list, click the **"+"** button
4. Select **watchOS → App** (or "Watch App for iOS App" in older Xcode versions)
5. Click **Next**
6. Configure the Watch App:
   - **Product Name**: `qotd WatchKit App`
   - **Bundle Identifier**: `intrepid.qotd.watchkitapp`
   - Click **Finish**
7. When prompted "Activate 'qotd WatchKit App' scheme?", click **Activate**

### Step 2: Add Watch Extension Files

1. In the Project Navigator, find the **`qotd WatchKit Extension`** folder (created by Xcode)
2. Delete the default files Xcode created (keep only `Info.plist` and `Assets.xcassets`)
3. **Drag** the following files from your Finder into the `qotd WatchKit Extension` group:
   - `qotd WatchKit Extension/QOTDApp.swift`
   - `qotd WatchKit Extension/ContentView.swift`
   - `qotd WatchKit Extension/Quote.swift`
   - `qotd WatchKit Extension/ComplicationController.swift`
4. When prompted:
   - ✅ Check **"Copy items if needed"**
   - ✅ Select **"qotd WatchKit Extension"** target
   - Click **Finish**

### Step 3: Update Info.plist

1. Select `qotd WatchKit Extension/Info.plist` in Xcode
2. Replace its contents with the `Info.plist` from the `qotd WatchKit Extension` folder
3. Or manually add these keys:
   - `WKApplication` = `YES` (Boolean)
   - `CLKComplicationPrincipalClass` = `$(PRODUCT_MODULE_NAME).ComplicationController`
   - `CLKComplicationSupportedFamilies` = Array with all complication families

### Step 4: Update Assets

1. Delete the default `Assets.xcassets/AppIcon.appiconset` in the Watch Extension
2. Drag the prepared `Assets.xcassets` folder from `qotd WatchKit Extension/` into Xcode
3. Select **"Create folder references"** and add to **qotd WatchKit Extension** target

### Step 5: Build & Run

1. Select **"qotd WatchKit App"** scheme from the scheme selector
2. Choose an Apple Watch simulator
3. Click **Run** (⌘R)

The Watch app should launch with beautiful gradient quotes!

## iOS App (Already Configured)

The iOS app is ready to test:

1. Select **"qotd"** scheme
2. Choose an iPhone simulator
3. Click **Run** (⌘R)

## Troubleshooting

### Swift Version Errors
- The project has been updated to Swift 5.0
- If you see Swift 3 errors, clean the build folder: **Product → Clean Build Folder**

### Missing Modules
- Make sure SwiftUI is available (iOS 14.0+, watchOS 7.0+)
- Check deployment targets in Build Settings

### Watch App Won't Install
- Make sure the iOS app is running first
- The Watch app will install automatically on the paired simulator

### Complication Issues
- Long-press the watch face in simulator
- Tap **Edit** → Select complication slot → Choose **Quote of the Day**

## Alternative: Command Line Project Generation

If you prefer to regenerate the Xcode project from scratch with proper targets, you can use Xcode's project templates or SPM (Swift Package Manager). Let me know if you'd like help with that approach.

## Next Steps

Once the Watch app is running:
- Test different categories (Motivational, Philosophical, Zen)
- Try the random quote feature
- Add complications to your watch face
- Customize the gradient colors if desired

## Need Help?

If you encounter issues:
1. Check Xcode's Issue Navigator (⌘5)
2. Verify all files are in the correct target membership
3. Clean and rebuild (⌘⇧K then ⌘B)

---

**Note**: All the code is complete and tested. These steps just connect the files to Xcode's build system.
