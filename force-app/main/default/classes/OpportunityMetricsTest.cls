@isTest
public class OpportunityMetricsTest{
    @TestSetup
    static void makeData(){
        List<Opportunity> opportunities = new List<Opportunity>();

        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Opportunity 1';
        opp1.StageName = 'Prospecting';
        opp1.CloseDate = Date.today().addDays(1);
        opp1.Amount = 1000;
        opportunities.add(opp1);

        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Opportunity 2';
        opp2.StageName = 'Prospecting';
        opp2.CloseDate = Date.today().addDays(1);
        opp2.Amount = 1000;
        opportunities.add(opp2);

        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Opportunity 3';
        opp3.StageName = 'Negotiation/Review';
        opp3.CloseDate = Date.today().addDays(1);
        opp3.Amount = 1000;
        opportunities.add(opp3);

        Opportunity opp4 = new Opportunity();
        opp4.Name = 'Opportunity 4';
        opp4.StageName = 'Negotiation/Review';
        opp4.CloseDate = Date.today().addDays(1);
        opp4.Amount = 1000;
        opportunities.add(opp4);

        Opportunity opp5 = new Opportunity();
        opp5.Name = 'Opportunity 5';
        opp5.StageName = 'Value Proposition';
        opp5.CloseDate = Date.today().addDays(1);
        opp5.Amount = 1000;
        opportunities.add(opp5);

        Opportunity opp6 = new Opportunity();
        opp6.Name = 'Opportunity 6';
        opp6.StageName = 'Value Proposition';
        opp6.CloseDate = Date.today().addDays(1);
        opp6.Amount = 1000;
        opportunities.add(opp6);

        Opportunity opp7 = new Opportunity();
        opp7.Name = 'Opportunity 7';
        opp7.StageName = 'Closed Won';
        opp7.CloseDate = Date.today().addDays(1);
        opp7.Amount = 1000;
        opportunities.add(opp7);

        Opportunity opp8 = new Opportunity();
        opp8.Name = 'Opportunity 8';
        opp8.StageName = 'Closed Won';
        opp8.CloseDate = Date.today().addDays(1);
        opp8.Amount = 1000;
        opportunities.add(opp8);

        Opportunity opp9 = new Opportunity();
        opp9.Name = 'Opportunity 9';
        opp9.StageName = 'Closed Won';
        opp9.CloseDate = Date.today().addDays(1);
        opp9.Amount = 1000;
        opportunities.add(opp9);

        Opportunity opp10 = new Opportunity();
        opp10.Name = 'Opportunity 10';
        opp10.StageName = 'Closed Won';
        opp10.CloseDate = Date.today().addDays(1);
        opp10.Amount = 1000;
        opportunities.add(opp10);

        Opportunity opp11 = new Opportunity();
        opp11.Name = 'Opportunity 11';
        opp11.StageName = 'Closed Won';
        opp11.CloseDate = Date.today().addDays(1);
        opp11.Amount = 1000;
        opportunities.add(opp11);

        insert opportunities;
    }

    @isTest
    static void OpportunityTest(){
        Test.startTest();
        Map<String, Decimal> winRates = OpportunityMetrics.calculateOpportunityWinRatesByStage();

        Test.stopTest();

        system.assertEquals(50, winRates.get('Prospecting'));
    }

}