import Foundation
import Cocoa

public class Horai
{
    public var locale: Locale = Locale.current
    
    public init(locale: Locale = Locale.current) {
        self.locale = locale
    }
    
    private let dateFormatter = DateFormatter()
    
    public func GetDateFromNSDate(nsDate: NSDate = NSDate()) -> Date
    {
        return (nsDate as Date)
    }
    
    public func GetNSDateFromDate(date: Date = Date()) -> NSDate
    {
        return (date as NSDate)
    }
    
    public enum TimeFormats : String
    {
        case HOUR = "HH",
            MINUTE = "mm",
            SECOND = "ss",
            MILISECOND = "SS",
            HOUR_MINUTE_COMMA = "HH:mm",
            HOUR_MINUTE_SLASHED = "HH/mm",
            HOUR_MINUTE_DASHED = "HH-mm",
            HOUR_MINUTE_SECOND_COMMA = "HH:mm:ss",
            HOUR_MINUTE_SECOND_SLASHED = "HH/mm/ss",
            HOUR_MINUTE_SECOND_DASHED = "HH-mm-ss",
            HOUR_MINUTE_SECOND_MILLISECOND_COMMA = "HH:mm:ss:SS"
    }
    
    public enum DateFormats : String
    {
        case DAY = "dd",
            MONTH = "MMMM",
            YEAR = "yyyy",
            WEEK_DAY = "EEEE",
            WEEK_DAY_SHORT = "EE",
            WEEK_DAY_MONTH_YEAR_INTER = "EEEE, dd/MMMM/yyyy",
            DAY2_MONTH_YEAR_SLASHED = "dd/MMMM/yyyy",
            DAY2_MONTH2_YEAR_SLASHED = "dd/MM/yyyy",
            DAY2_MONTH2_YEAR2_SLASHED = "dd/MM/yy"
    }
    
    public enum DateTimeFormats : String
    {
        case HOUR_MINUTE_DAY_MONTH_YEAR_SPACED = "HH mm dd MM yyyy",
            HOUR_MINUTE_COMMA_DAY_MONTH_YEAR_SLASHED = "HH:mm dd/MMMM/yyyy"
    }
    
    public func PretifyDate(date: Date, dateFormat: DateFormats) -> String
    {
        self.dateFormatter.dateFormat = dateFormat.rawValue
        self.dateFormatter.locale = self.locale
        return self.getDateFormatted(date: date)
    }
    
    public func PretifyTime(date: Date, timeFormat: TimeFormats) -> String
    {
        self.dateFormatter.dateFormat = timeFormat.rawValue
        self.dateFormatter.locale = self.locale
        return self.getDateFormatted(date: date)
    }
    
    public func PretifyDateTime(date: Date, dateTimeFormat: DateTimeFormats) -> String
    {
        self.dateFormatter.dateFormat = dateTimeFormat.rawValue
        self.dateFormatter.locale = self.locale
        return self.getDateFormatted(date: date)
    }
    
    private func getDateFormatted(date: Date) -> String
    {
        return self.dateFormatter.string(from: date)
    }
    
    public func GetFormatedString(date: Date,
                                  formattingString: String,
                                  locale: Locale? = nil) -> String
    {
        let dateFormat = DateFormatter()
        dateFormat.locale = locale ?? self.locale
        dateFormat.dateFormat = formattingString
        return dateFormat.string(from: date)
    }
}
