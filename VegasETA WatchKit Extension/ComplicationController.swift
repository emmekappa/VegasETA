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
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(NSDate(timeIntervalSinceNow: (60*60*24)))
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        handler(nil)
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
        // This method will be called once per supported complication, and the results will be cached
        //handler(nil)
        var entries: [CLKComplicationTimelineEntry] = []
        
        for show in shows
        {
            if entries.count < limit && show.startDate.timeIntervalSinceDate(date) > 0
            {
                let template = CLKComplicationTemplateModularLargeStandardBody()
                
                template.headerTextProvider = CLKTimeIntervalTextProvider(startDate: show.startDate, endDate: NSDate(timeInterval: show.length, sinceDate: show.startDate))
                template.body1TextProvider = CLKSimpleTextProvider(text: show.name, shortText: show.shortName)
                template.body2TextProvider = CLKSimpleTextProvider(text: show.genre, shortText: nil)
                
                let entry = CLKComplicationTimelineEntry(date: NSDate(timeInterval: hour * -0.25, sinceDate: show.startDate), complicationTemplate: template)
                entries.append(entry)
            }
        }
        
        handler(entries)
    }
    
}
