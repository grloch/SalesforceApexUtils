public class RecordHelper{
    // this class isn't finished, it's just a idea, sorry :(
        /*private Map<String, Set<String>> mpSObjects;

        public recordDeleter(){
            this.mpSObjects = new Map<String, Set<String>>();
        }

        public addItem(String sObjectAPIName, String fieldName, String fieldValue, Boolean useLike){
            for(String s : new List<String>{sObjectAPIName, fieldName, fieldValue}){
                if(s == null || s == '') return;
            }
            
            if(useLike == null) useLike = false;

            if(!this.mpSObjects.containsKey(sObjectName)) this.mpSObjects.put(sObjectName, new Set<String>());

            this.mpSObjects.get(sObjectName).add(fieldName + (useLike ? ' LIKE ' : ' = ') + fieldValue);
        }

        public Integer performDeletion(){
            String queryTemplate = 'SELECT ID FROM {1} WHERE {2}';
            List<sObject> deletedRecords = new List<sObject>();

            for(String sObjectApiName : this.mpSObjects.keySet()){
                List<String> queryParams = new List<String>();

                queryParams.add(sObjectApiName); // sObject API name
                queryParams.add(String.join(this.mpSObjects.get(sObjectApiName), ' OR ')); 

                String searchQuery = String.format(queryTemplate, queryParams);

                // deletedRecords.addAll(Database.query(searchQuery));
            }
        }
        */
}
