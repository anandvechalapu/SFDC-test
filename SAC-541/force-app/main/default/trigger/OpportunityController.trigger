trigger ViewOpenOpportunity on Opportunity (after insert, after update) {
    List<Opportunity> openOpps = new List<Opportunity>();
    for(Opportunity opp : trigger.new) {
        if(opp.StageName == 'Open') {
            openOpps.add(opp);
        }
    }
    if(openOpps.size() > 0) {
        ViewOpenOpportunityController.updateOpportunities(openOpps);
    }

}