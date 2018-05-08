var Migrations = artifacts.require("Migrations");

contract('Migrations Js Test Unit', function (accounts) {
    it("should put 10000 MetaCoin in the first account", function () {
        return Migrations.deployed().then(function (instance) {
            return instance.getBalance.call(accounts[0]);
        }).then(function (balance) {
            assert.equal(balance.valueOf() > 1000 , true ,"it needs more than 1000");
        });
    });
    it("should call a function that depends on a linked library", function () {
        var meta;
        var metaCoinBalance;
        var metaCoinEthBalance;

        return Migrations.deployed().then(function (instance) {
            meta = instance;
            return meta.getBalance.call(accounts[0]);
        }).then(function (outCoinBalance) {
            metaCoinBalance = outCoinBalance.toNumber();
            return meta.getBalanceInEth.call(accounts[0]);
        }).then(function (outCoinBalanceEth) {
            metaCoinEthBalance = outCoinBalanceEth.toNumber();
        }).then(function () {
            assert.equal(metaCoinEthBalance, 2 * metaCoinBalance, "Library function returned unexpected function, linkage may be broken");
        });
    });
    it("should send coin correctly", function () {
        var meta;

        // Get initial balances of first and second account.
        var account_one = accounts[0];
        var account_two = accounts[1];

        var account_one_starting_balance;
        var account_two_starting_balance;
        var account_one_ending_balance;
        var account_two_ending_balance;

        var amount = 10;

        return Migrations.deployed().then(function (instance) {
            meta = instance;
            return meta.getBalance.call(account_one);
        }).then(function (balance) {
            account_one_starting_balance = balance.toNumber();
            return meta.getBalance.call(account_two);
        }).then(function (balance) {
            account_two_starting_balance = balance.toNumber();
            return meta.sendCoin(account_two, amount, { from: account_one });
        }).then(function () {
            return meta.getBalance.call(account_one);
        }).then(function (balance) {
            account_one_ending_balance = balance.toNumber();
            return meta.getBalance.call(account_two);
        }).then(function (balance) {
            account_two_ending_balance = balance.toNumber();

            assert.equal(account_one_ending_balance, account_one_starting_balance - amount, "Amount wasn't correctly taken from the sender");
            assert.equal(account_two_ending_balance, account_two_starting_balance + amount, "Amount wasn't correctly sent to the receiver");
        });
    });
});
