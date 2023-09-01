public class F_GetRecordTypeId {
    @InvocableMethod(label='Buscar tipo de registro do objeto' description='desc')
    public static List<Flow_Output> getLstRecorTypesId(List<Flow_Input> lstInput) {
      List<FlowOutput> response = new List<FlowOutput>();
  
      for (FlowInput inputItem : lstInput) {
        response.add(new Flow_Output(Utills.getRecordTypeId(inputItem.sObjectName, inputItem.recordTypeApI)));
      }
  
      return response;
    }
  
    public class Flow_Input {
      @InvocableVariable(required=true)
      public String sObjectName;
  
      @InvocableVariable(required=true)
      public String recordTypeApI;
  
      public FlowInput(String sObjectApiName, String recordTypeApI) {
        this.sObjectName = sObjectName;
        this.recordTypeApI = recordTypeApI;
      }
  
      public FlowInput() {
      }
    }
  
    public class Flow_Output {
      @InvocableVariable
      public String recordTypeId;
  
      public FlowOutput(String recordTypeId) {
        this.recordTypeId = recordTypeId;
      }
    }
  }
  