public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer n) {
        
        List<String> generatedStrList = new List<String>();
        
        for(Integer i = 0; i < n; i++) {
            
            generatedStrList.add('Test ' + i);
        
        }
    
        return generatedStrList;
    }
    
}