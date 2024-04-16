/**
 * 
 * @On(event = { "CREATE" }, entity = "loyaltyProgramSrv.Purchases")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { data } = request;

  // Calculate reward points based on purchase value
  data.rewardPoints = Math.floor(data.purchaseValue / 10);

  // Retrieve the related customer
  const customer = await SELECT.one().from('loyaltyProgramSrv.Customers').where({ ID: data.customer_ID });

  // Update the total purchase value and total reward points of the related customer
  await UPDATE('loyaltyProgramSrv.Customers')
    .set({
      totalPurchaseValue: { '+=': data.purchaseValue },
      totalRewardPoints: { '+=': data.rewardPoints }
    })
    .where({ ID: data.customer_ID });

  // Return the updated purchase data
  return data;
}