//
//  Week.swift
//  com.kidemma
//
//  Created by daniel.a.robles on 19/02/26.
//

import Foundation

/// A Monday–Sunday week, stored with timezone/DST-safe boundaries.
///
/// - `start`: Monday at start-of-day (00:00:00 local time)
/// - `end`: Sunday at end-of-day (23:59:59 local time, computed DST-safe)
struct Week: Equatable, Hashable {
    let start: Date
    let end: Date
    
    // MARK: - Label styles
    
    enum LabelStyle {
        /// Uses the month/year of the Monday (start).
        /// Example: "03-09 March - 2026"
        case startMonth
        
        /// If week spans months (or years), shows both.
        /// Example: "29-04 Jan/Feb - 2026" (or "29-04 Dec/Jan - 2025/2026")
        case rangeMonths
    }
    
    // MARK: - Calendar config
    
    /// ISO-like week rules (Mon start, 4 days minimum).
    static func isoCalendar(_ base: Calendar = .current) -> Calendar {
        var cal = base
        cal.firstWeekday = 2               // Monday
        cal.minimumDaysInFirstWeek = 4     // ISO week rule
        return cal
    }
    
    // MARK: - Factory
    
    static func containing(_ date: Date, calendar: Calendar = .current) -> Week {
        let cal = isoCalendar(calendar)
        
        // Start of week (Monday), then normalize to start-of-day.
        let weekStart = cal.dateInterval(of: .weekOfYear, for: date)?.start ?? date
        let mondayStart = cal.startOfDay(for: weekStart) // DST-safe day start [2](https://gitscripts.com/git-status-untracked-files)
        
        // DST-safe end-of-week:
        // End = (start + 7 days) - 1 second  [3](https://tecadmin.net/git-untracked-files/)
        let endExclusive = cal.date(byAdding: .day, value: 7, to: mondayStart)!
        let sundayEnd = cal.date(byAdding: .second, value: -1, to: endExclusive)!
        
        return Week(start: mondayStart, end: sundayEnd)
    }
    
    // MARK: - Next / Previous week
    
    func next(calendar: Calendar = .current) -> Week {
        let cal = Week.isoCalendar(calendar)
        // Add one ISO week using weekOfYear (safe across year boundaries) [1](https://stackoverflow.com/questions/39361107/swift-add-1-week-to-current-date)
        let nextAnchor = cal.date(byAdding: .weekOfYear, value: 1, to: start)!
        return Week.containing(nextAnchor, calendar: cal)
    }
    
    func previous(calendar: Calendar = .current) -> Week {
        let cal = Week.isoCalendar(calendar)
        let prevAnchor = cal.date(byAdding: .weekOfYear, value: -1, to: start)!
        return Week.containing(prevAnchor, calendar: cal)
    }
    
    // MARK: - Ranges
    
    /// Inclusive range (UI filtering).
    var inclusiveRange: ClosedRange<Date> {
        start...end
    }
    
    /// Exclusive range (APIs/DB): [start, nextMondayStart)
    func exclusiveRange(calendar: Calendar = .current) -> Range<Date> {
        let cal = Week.isoCalendar(calendar)
        let nextMonday = cal.date(byAdding: .day, value: 7, to: cal.startOfDay(for: start))!
        return start..<nextMonday
    }
    
    // MARK: - Formatting
    
    /// "dd(from)-dd(to) Month - yyyy" (or "dd-dd Mon1/Mon2 - yyyy")
    func label(style: LabelStyle = .startMonth,
               locale: Locale = .current,
               timeZone: TimeZone = .current) -> String {
        
        let dd = DateFormatter()
        dd.locale = locale
        dd.timeZone = timeZone
        dd.dateFormat = "dd"
        
        let month = DateFormatter()
        month.locale = locale
        month.timeZone = timeZone
        month.dateFormat = "MMM" // short month for "Jan/Feb"
        
        let monthLong = DateFormatter()
        monthLong.locale = locale
        monthLong.timeZone = timeZone
        monthLong.dateFormat = "MMMM" // long month for normal mode
        
        let yyyy = DateFormatter()
        yyyy.locale = locale
        yyyy.timeZone = timeZone
        yyyy.dateFormat = "yyyy"
        
        let fromDay = dd.string(from: start)
        let toDay = dd.string(from: end)
        
        let startYear = yyyy.string(from: start)
        let endYear = yyyy.string(from: end)
        let yearPart = (startYear == endYear) ? startYear : "\(startYear)/\(endYear)"
        
        switch style {
        case .startMonth:
            let monthPart = monthLong.string(from: start)
            return "\(fromDay)-\(toDay) \(monthPart) - \(yearPart)"
            
        case .rangeMonths:
            let startMonth = month.string(from: start)
            let endMonth = month.string(from: end)
            let monthPart = (startMonth == endMonth) ? startMonth : "\(startMonth)/\(endMonth)"
            return "\(fromDay)-\(toDay) \(monthPart) - \(yearPart)"
        }
    }
}
