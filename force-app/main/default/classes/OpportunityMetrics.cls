public class OpportunityMetrics{
    public static Map<String, Decimal> calculateOpportunityWinRatesByStage(){
        Map<String, Decimal> winRatesByStage = new Map<String, Decimal>();

        List<Opportunity> closedWon = [SELECT StageName, CloseDate
                                       FROM Opportunity
                                       WHERE StageName = 'Closed Won'];

        List<Opportunity> opps = [SELECT StageName
                                  FROM Opportunity
                                  WHERE StageName != 'Closed Won'];

        Map<String, Integer> quantityByStage = new Map<String, Integer>();

        for (Opportunity o : opps){
            if (!quantityByStage.containsKey(o.StageName)){
                quantityByStage.put(o.StageName, 1);

            } else{
                Integer StageQuantity = quantityByStage.get(o.StageName);
                quantityByStage.put(o.StageName, StageQuantity + 1);

            }


        }

        for (String s : quantityByStage.keySet()){
            Integer quantity = quantityByStage.get(s);
            Decimal winRatioNumber = closedWon.size() / quantity;
            Decimal winRatio = (winRatioNumber * 100) / closedWon.size();
            winRatesByStage.put(s, winRatio.setScale(2));
        }

        Schema.DescribeFieldResult fieldDescribe = Schema.getGlobalDescribe().get('Opportunity').getDescribe().fields.getMap().get('StageName').getDescribe();

        List<Schema.PicklistEntry> picklistValues = fieldDescribe.getPicklistValues();

        for (Schema.PicklistEntry option : picklistValues){

            String thisStage = option.getValue();

            if (option.isActive() && thisStage!='Closed Won'){
                if (!winRatesByStage.containsKey(thisStage)){
                    winRatesByStage.put(thisStage, 0);

                }
            }
        }


        return winRatesByStage;
    }

}