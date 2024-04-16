using { loyaltyProgram } from '../srv/service.cds';

annotate loyaltyProgram.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers' };
annotate loyaltyProgram.Customers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate loyaltyProgram.Customers with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate loyaltyProgram.Customers with @UI.DataPoint #customerNumber: {
  Value: customerNumber,
  Title: 'Customer Number',
};
annotate loyaltyProgram.Customers with {
  name @title: 'Name';
  email @title: 'Email';
  customerNumber @title: 'Customer Number';
  totalPurchaseValue @title: 'Total Purchase Value';
  totalRewardPoints @title: 'Total Reward Points';
  totalRedeemedRewardPoints @title: 'Total Redeemed Reward Points'
};

annotate loyaltyProgram.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
];

annotate loyaltyProgram.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
  ]
};

annotate loyaltyProgram.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerNumber' }
];

annotate loyaltyProgram.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate loyaltyProgram.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products' };
annotate loyaltyProgram.Products with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate loyaltyProgram.Products with {
  name @title: 'Name';
  description @title: 'Description';
  price @title: 'Price'
};

annotate loyaltyProgram.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price }
];

annotate loyaltyProgram.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price }
  ]
};

annotate loyaltyProgram.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate loyaltyProgram.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate loyaltyProgram.Purchases with @UI.HeaderInfo: { TypeName: 'Purchase', TypeNamePlural: 'Purchases' };
annotate loyaltyProgram.Purchases with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate loyaltyProgram.Purchases with {
  selectedProduct @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: selectedProduct_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate loyaltyProgram.Purchases with @UI.DataPoint #purchaseValue: {
  Value: purchaseValue,
  Title: 'Purchase Value',
};
annotate loyaltyProgram.Purchases with @UI.DataPoint #rewardPoints: {
  Value: rewardPoints,
  Title: 'Reward Points',
};
annotate loyaltyProgram.Purchases with {
  purchaseValue @title: 'Purchase Value';
  rewardPoints @title: 'Reward Points'
};

annotate loyaltyProgram.Purchases with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: selectedProduct_ID }
];

annotate loyaltyProgram.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: selectedProduct_ID }
  ]
};

annotate loyaltyProgram.Purchases with {
  customer @Common.Label: 'Customer';
  selectedProduct @Common.Label: 'Product'
};

annotate loyaltyProgram.Purchases with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#purchaseValue' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#rewardPoints' }
];

annotate loyaltyProgram.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate loyaltyProgram.Purchases with @UI.SelectionFields: [
  customer_ID,
  selectedProduct_ID
];

annotate loyaltyProgram.Redemptions with @UI.HeaderInfo: { TypeName: 'Redemption', TypeNamePlural: 'Redemptions' };
annotate loyaltyProgram.Redemptions with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate loyaltyProgram.Redemptions with @UI.DataPoint #redeemedAmount: {
  Value: redeemedAmount,
  Title: 'Redeemed Amount',
};
annotate loyaltyProgram.Redemptions with {
  redeemedAmount @title: 'Redeemed Amount'
};

annotate loyaltyProgram.Redemptions with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate loyaltyProgram.Redemptions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate loyaltyProgram.Redemptions with {
  customer @Common.Label: 'Customer'
};

annotate loyaltyProgram.Redemptions with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#redeemedAmount' }
];

annotate loyaltyProgram.Redemptions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate loyaltyProgram.Redemptions with @UI.SelectionFields: [
  customer_ID
];

