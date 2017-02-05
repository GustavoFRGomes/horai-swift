import Foundation
import Cocoa

public class Horai
{
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
            HOUR_MINUTE_COMMA = "HH:mm",
            HOUR_MINUTE_SECOND_COMMA = "HH:mm:ss",
            HOUR_MINUTE_SECOND_SLASHED = "HH/mm/ss"
    }
    
    public enum DateFormats : String
    {
        case DAY = "dd",
            MONTH = "MMMM",
            YEAR = "yyyy"
    }
    
    public enum DateTimeFormats : String
    {
        case HOUR_MINUTE_DAY_MONTH_YEAR_SPACED = "HH mm dd MM yyyy"
    }
    
    public func PretifyDate(date: Date, dateFormat: DateFormats) -> String
    {
        self.dateFormatter.dateFormat = dateFormat.rawValue
        return self.getDateFormatted(date: date)
    }
    
    public func PretifyTime(date: Date, timeFormat: TimeFormats) -> String
    {
        self.dateFormatter.dateFormat = timeFormat.rawValue
        return self.getDateFormatted(date: date)
    }
    
    public func PretifyDateTime(date: Date, dateTimeFormat: DateTimeFormats) -> String
    {
        self.dateFormatter.dateFormat = dateTimeFormat.rawValue
        return self.getDateFormatted(date: date)
    }
    
    private func getDateFormatted(date: Date) -> String
    {
        return self.dateFormatter.string(from: date)
    }
    
    public func GetFormatedString(date: Date, formattingString: String) -> String
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = formattingString
        return dateFormat.string(from: date)
    }
}
