Feature: Token Info
    The BridgeFee has token info managed by module admin. Token info describes token buffer
    and token specific configuration when processing fees.

    Scenario: Set token info
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 set token info
        When typing "pocket bridgefee set-token-info <fromAddr> <token> <bufferSize> <tokenSpecificConfig> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the fee rates
        When typing "pocket query all-token-infos"
        Then the signer should be added
            |  |
            {
            "Infos": [
            {
            "bufferSize": "1000",
            "token": "upokt"
            }
            ]
            }
            |  |
