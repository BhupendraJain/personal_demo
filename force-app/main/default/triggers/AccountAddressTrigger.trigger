trigger AccountAddressTrigger on Account (before insert) {
    // Take new Account, which is to be inserted
    for(Account a : Trigger.New) {
        // If custom check box - Match_Billing_Address__c is checked,
        // then BillingPostalCode should be the ShippingPostalCode 
        if(a.Match_Billing_Address__c && a.BillingPostalCode != null && a.BillingPostalCode != '') {
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}