//
//  ComplicationController.swift
//  VegasETA WatchKit Extension
//
//  Created by Michele Cantelli on 21/05/17.
//  Copyright © 2017 Michele Cantelli. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate(timeIntervalSinceNow: (60 * 60 * 24)))
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    func getNextRequestedUpdateDate(handler: @escaping (Date?) -> Void) {
        handler(Date(timeIntervalSinceNow: TimeInterval(10*60)))
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        switch complication.family {
            
        case .modularSmall:
            let template = CLKComplicationTemplateModularSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "real")
            template.fillFraction = self.dayFraction
            handler(CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template))
            
        case .utilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "real")
            template.fillFraction = self.dayFraction
            handler(CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template))
            
        default:
            NSLog("%@", "Unknown complication type: \(complication.family)")
            handler(nil)
        }
    }
    
    var dayFraction : Float {
        let now = Date()
        let calendar = Calendar.current
        let componentFlags = Set<Calendar.Component>([.year, .month, .day, .weekOfYear,     .hour, .minute, .second, .weekday, .weekdayOrdinal])
        var components = calendar.dateComponents(componentFlags, from: now)
        components.hour = 0
        components.minute = 0
        components.second = 0
        let startOfDay = calendar.date(from: components)!
        return Float(now.timeIntervalSince(startOfDay)) / Float(24*60*60)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        if complication.family == .utilitarianSmall {
            let template = CLKComplicationTemplateUtilitarianSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "HI")
            template.fillFraction = self.dayFraction
            handler(template)
        } else {
            handler(nil)
        }
    }
    
}
