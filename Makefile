all    :; dapp build
clean  :; dapp clean
test   :; dapp test
deploy :; dapp create CompHevmIssue
test-live :; hevm dapp-test --rpc=<YOUR ETH RPC> --json-file=out/dapp.sol.json --dapp-root=. --verbose 1
