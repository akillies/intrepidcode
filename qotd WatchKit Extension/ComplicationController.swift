//
//  ComplicationController.swift
//  qotd WatchKit Extension
//
//  Created by Claude
//  Copyright © 2025 intrepidcode. All rights reserved.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {

    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(
                identifier: "complication",
                displayName: "Quote of the Day",
                supportedFamilies: CLKComplicationFamily.allCases
            )
        ]
        handler(descriptors)
    }

    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration

    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        let endDate = Date().addingTimeInterval(86400 * 7) // 7 days
        handler(endDate)
    }

    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population

    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        let quote = QuoteManager.shared.getQuoteOfTheDay()
        let entry = createTimelineEntry(for: complication, quote: quote, date: Date())
        handler(entry)
    }

    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        var entries: [CLKComplicationTimelineEntry] = []
        let calendar = Calendar.current

        for i in 1...min(limit, 7) {
            if let futureDate = calendar.date(byAdding: .day, value: i, to: date) {
                let startOfDay = calendar.startOfDay(for: futureDate)
                let quote = QuoteManager.shared.getQuoteOfTheDay()
                if let entry = createTimelineEntry(for: complication, quote: quote, date: startOfDay) {
                    entries.append(entry)
                }
            }
        }

        handler(entries)
    }

    // MARK: - Sample Templates

    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        let quote = QuoteManager.shared.quotes.first ?? Quote(
            text: "The obstacle is the path.",
            author: "Zen Proverb",
            category: .zen
        )
        let template = createTemplate(for: complication, quote: quote)
        handler(template)
    }

    // MARK: - Helper Methods

    private func createTimelineEntry(for complication: CLKComplication, quote: Quote, date: Date) -> CLKComplicationTimelineEntry? {
        guard let template = createTemplate(for: complication, quote: quote) else {
            return nil
        }
        return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
    }

    private func createTemplate(for complication: CLKComplication, quote: Quote) -> CLKComplicationTemplate? {
        switch complication.family {
        case .modularSmall:
            return createModularSmallTemplate(quote: quote)
        case .modularLarge:
            return createModularLargeTemplate(quote: quote)
        case .utilitarianSmall:
            return createUtilitarianSmallTemplate(quote: quote)
        case .utilitarianLarge:
            return createUtilitarianLargeTemplate(quote: quote)
        case .circularSmall:
            return createCircularSmallTemplate(quote: quote)
        case .graphicCorner:
            return createGraphicCornerTemplate(quote: quote)
        case .graphicCircular:
            return createGraphicCircularTemplate(quote: quote)
        case .graphicRectangular:
            return createGraphicRectangularTemplate(quote: quote)
        case .graphicBezel:
            return createGraphicBezelTemplate(quote: quote)
        case .extraLarge:
            return createExtraLargeTemplate(quote: quote)
        @unknown default:
            return nil
        }
    }

    private func createModularSmallTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateModularSmallSimpleText()
        template.textProvider = CLKSimpleTextProvider(text: "💭")
        return template
    }

    private func createModularLargeTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateModularLargeStandardBody()
        template.headerTextProvider = CLKSimpleTextProvider(text: "Quote")
        let shortQuote = String(quote.text.prefix(50))
        template.body1TextProvider = CLKSimpleTextProvider(text: shortQuote)
        return template
    }

    private func createUtilitarianSmallTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateUtilitarianSmallFlat()
        template.textProvider = CLKSimpleTextProvider(text: "💭 Quote")
        return template
    }

    private func createUtilitarianLargeTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateUtilitarianLargeFlat()
        let shortQuote = String(quote.text.prefix(30))
        template.textProvider = CLKSimpleTextProvider(text: shortQuote)
        return template
    }

    private func createCircularSmallTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateCircularSmallSimpleText()
        template.textProvider = CLKSimpleTextProvider(text: "💭")
        return template
    }

    private func createGraphicCornerTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateGraphicCornerTextImage()
        template.textProvider = CLKSimpleTextProvider(text: "Quote")
        template.imageProvider = CLKFullColorImageProvider(fullColorImage: UIImage(systemName: "quote.bubble.fill")!)
        return template
    }

    private func createGraphicCircularTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateGraphicCircularImage()
        template.imageProvider = CLKFullColorImageProvider(fullColorImage: UIImage(systemName: "quote.bubble.fill")!)
        return template
    }

    private func createGraphicRectangularTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateGraphicRectangularStandardBody()
        template.headerTextProvider = CLKSimpleTextProvider(text: "💭 Daily Quote")
        let shortQuote = String(quote.text.prefix(60))
        template.body1TextProvider = CLKSimpleTextProvider(text: shortQuote)
        return template
    }

    private func createGraphicBezelTemplate(quote: Quote) -> CLKComplicationTemplate {
        let circularTemplate = CLKComplicationTemplateGraphicCircularImage()
        circularTemplate.imageProvider = CLKFullColorImageProvider(fullColorImage: UIImage(systemName: "quote.bubble.fill")!)

        let template = CLKComplicationTemplateGraphicBezelCircularText()
        template.circularTemplate = circularTemplate
        template.textProvider = CLKSimpleTextProvider(text: quote.category.rawValue)
        return template
    }

    private func createExtraLargeTemplate(quote: Quote) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateExtraLargeSimpleText()
        template.textProvider = CLKSimpleTextProvider(text: "💭")
        return template
    }
}
