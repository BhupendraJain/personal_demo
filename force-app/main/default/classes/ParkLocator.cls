public class ParkLocator {
    public static list<string> country(string co){
        ParkService.ParksImplPort ps= new ParkService.ParksImplPort();
        return ps.bycountry(co);
    }
}