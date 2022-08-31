Feature: Swap
    The BridgePool accept swap operation to put funds into bridgepool and
    to send the amount on other chain by relayer nodes.

    Scenario: Swap
        Given a pocket network with <ChainID>
        And target network allowed by module admin
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 with enough balance exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 execute swap operation
        When typing "pocket  bridgepool swap <fromAddr> <token> <amount> <targetNetwork> <targetToken> <targetAddress> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the balance of the account
        When typing "pocket query balance 169869f67cd3f78a722fb4795b69949fb4bc9084"
        Then the amount should be reduced
        When user query the balace of bridgepool module account
        When typing "pocket query balance 07c4372d065678d64711a7162e194d729c2b3fa0"
        Then the amount should be increased
