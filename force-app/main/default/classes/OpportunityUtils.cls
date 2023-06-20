public class OpportunityUtils{
    // This should be done with a batch process, because a single query can only retrieve 50K records.
    public static Decimal calculateAverageOpportunityAmount(){
        Decimal averageAmount = 0;

        List<Opportunity> oppList = [SELECT Amount
                                     FROM Opportunity
                                     WHERE StageName = 'Closed Won'];


        for (Opportunity opp : oppList){
            averageAmount = averageAmount + opp.Amount;

        }


        return averageAmount / oppList.size();

    }

}