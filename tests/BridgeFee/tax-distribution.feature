Feature: Tax distribution
    The BridgeFee module distribute fees to targets at the time of withdraw signed operation.

    Scenario: Tax distribution for small amount when fee is lower than buffer size
        Given a pocket network with <ChainID>
        And target network allowed by module admin
        And enough liquidity available on the bridgepool module account
        And token info and token target info set
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 execute withdraw signed operation with small amount
        When typing "pocket bridgepool withdraw-signed <fromAddr> <payee> <amount> <salt> <signature> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the balance of the account
        When typing "pocket query balance 169869f67cd3f78a722fb4795b69949fb4bc9084"
        Then the amount should be increased
        When user query the balace of bridgepool module account
        When typing "pocket query balance 07c4372d065678d64711a7162e194d729c2b3fa0"
        Then the amount should be decreased
        When user query the balace of bridgefee module account
        When typing "pocket query balance 56abb3c7677bf17098ef768a58c570fafc3221ca"
        Then the amount should be increased
        When user query the balace of fee target account
        When typing "pocket query balance <fee_target>"
        Then the amount should be empty

    Scenario: Tax distribution for bigger amount where fee is bigger than buffer size
        Given a pocket network with <ChainID>
        And target network allowed by module admin
        And enough liquidity available on the bridgepool module account
        And token info and token target info set
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 execute withdraw signed operation with large amount
        When typing "pocket bridgepool withdraw-signed <fromAddr> <payee> <amount> <salt> <signature> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the balance of the account
        When typing "pocket query balance 169869f67cd3f78a722fb4795b69949fb4bc9084"
        Then the amount should be increased
        When user query the balace of bridgepool module account
        When typing "pocket query balance 07c4372d065678d64711a7162e194d729c2b3fa0"
        Then the amount should be decreased
        When user query the balace of bridgefee module account
        When typing "pocket query balance 56abb3c7677bf17098ef768a58c570fafc3221ca"
        Then the amount should be zero
        When user query the balace of fee target account
        When typing "pocket query balance <fee_target>"
        Then the amount should be positive
