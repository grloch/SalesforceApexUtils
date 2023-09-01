public class Utils{
    public Id getRecordTypeId(String sObjectApiName, String recordTypeApiName){
        Map<String, Schema.SObjectType> sObjectGlobalDescription = Schema.getGlobalDescribe();

        return Schema.getGlobalDescribe().get(sObjectApiName)?.getDescribe()?.getRecordTypeInfosByDeveloperName().get(recordTypeApIName)?.getRecordTypeId();
    }
}