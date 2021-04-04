@isTest
public class StringUtils_Test {
    
    @isTest
    public static void prettyPhoneTest(){
        Test.startTest();
        
        System.assertEquals('', StringUtils.prettyPhone(null));
        System.assertEquals('11 91234-1234', StringUtils.prettyPhone('(11)912341234'));
        System.assertEquals('11 91234-1234', StringUtils.prettyPhone('('));
        
        Test.stopTest();
    }
    
    @isTest
    public static void camelCaseTest(){
        Test.startTest();
        
        System.assertEquals('myNameIsJohn', StringUtils.camelCase('My name Is John'));
        
        Test.stopTest();
    }
    
    @isTest
    public static void prettyMoneyTest(){
        Test.startTest();
        
        System.assertEquals('myNameIsJohn', StringUtils.prettyMoney(1234, 'USD'));
        
        Test.stopTest();
    }
    
}
