public class TempratureConverter {

    public static Decimal fahrenhitToCelsisius(Decimal fh) {
        if (fh >= 0) {
            Decimal cs = (fh - 32) * 5/9;
            return cs.setScale(2);
        } else {
            Decimal cs = (fh - 32) * 5/9;
            return cs.setScale(2);
        }
    }

}