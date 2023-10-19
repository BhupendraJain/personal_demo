@istest public class ParkLocatorTest {
    @istest public static void test(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country='United States';
        system.assertEquals(new List<String>{'Yosemita','Sequoia','Crator Lake'}, ParkLocator.country(country));
    }
}