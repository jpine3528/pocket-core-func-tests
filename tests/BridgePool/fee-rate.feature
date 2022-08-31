Feature: Fee Rates
    The BridgePool has fee rates per token that is managed by module admin.

    Scenario: Set fee rate
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 add a fee rate
        When typing "pocket bridgepool set-fee <fromAddr> <token> <fee-rate> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the fee rates
        When typing "pocket query fee-rates"
        Then the signer should be added
            |  |
            {
            "FeeRates": [
            {
            "rate": "100",
            "token": "upokt"
            }
            ]
            }
            |  |
