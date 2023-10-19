@isTest
private class TempratureConverterTest {
    
    @isTest
    static void testTemprature() {
        
        Test.startTest();
        Decimal celsius = TempratureConverter.fahrenhitToCelsisius(70);
        Test.stopTest();
        
        System.assertEquals(21.11, celsius);
    }
    
    @isTest static void testFreezingPoint() {
        Test.startTest();
        Decimal celsius = TempratureConverter.fahrenhitToCelsisius(32);
        Test.stopTest();
        System.assertEquals(0,celsius);
    }
    
    @isTest static void testBoilingPoint() {
        Test.startTest();
        Decimal celsius = TempratureConverter.fahrenhitToCelsisius(212);        
        Test.stopTest();
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    } 
    
    @isTest static void testNegativeTemp() {
        Test.startTest();
        Decimal celsius = TempratureConverter.fahrenhitToCelsisius(-10);
        Test.stopTest();
        System.assertEquals(-23.33,celsius);
    }
      
}