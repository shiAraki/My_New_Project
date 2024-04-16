/**
 * 
 * @On(event = { "CREATE" }, entity = "loyaltyProgramSrv.Redemptions")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { redeemedAmount, customer } = request.data;
    const { Customers } = this.entities;

    // Get the customer's current total reward points and total redeemed reward points
    const currentCustomer = await SELECT.one.from(Customers)
        .where({ ID: customer })
        .columns('totalRewardPoints', 'totalRedeemedRewardPoints');

    if (!currentCustomer) {
        request.error(404, `Customer with ID ${customer} not found`);
        return;
    }

    // Check if the customer has enough reward points to redeem
    if (currentCustomer.totalRewardPoints < redeemedAmount) {
        request.error(400, `Customer with ID ${customer} does not have enough reward points to redeem`);
        return;
    }

    // Deduct the redeemed amount from the customer's total reward points and add that to their total redeemed points
    const updatedCustomer = {
        totalRewardPoints: currentCustomer.totalRewardPoints - redeemedAmount,
        totalRedeemedRewardPoints: currentCustomer.totalRedeemedRewardPoints + redeemedAmount
    };

    // Update the customer's total reward points and total redeemed reward points
    await UPDATE(Customers)
        .set(updatedCustomer)
        .where({ ID: customer });

    // Return the updated customer data
    return updatedCustomer;
};