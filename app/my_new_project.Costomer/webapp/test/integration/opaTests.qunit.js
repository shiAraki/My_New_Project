sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'mynewproject/Costomer/test/integration/FirstJourney',
		'mynewproject/Costomer/test/integration/pages/CustomersList',
		'mynewproject/Costomer/test/integration/pages/CustomersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('mynewproject/Costomer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersList: CustomersList,
					onTheCustomersObjectPage: CustomersObjectPage
                }
            },
            opaJourney.run
        );
    }
);