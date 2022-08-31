Feature: Withdraw Signed
    The BridgePool accept withdraw signed operation to withdraw funds put on liquidity
    to users who bridge tokens from other networks to pocket network.

    Scenario: Withdraw signed
        Given a pocket network with <ChainID>
        And target network allowed by module admin
        And enough liquidity available on the module account
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 execute withdraw signed operation
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
