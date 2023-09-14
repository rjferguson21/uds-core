### Dependencies
UDS CLI/Zarf 

### Run
```bash
# create cluster with metallb + DUBBD + uds-idam + uds-sso 
make cluster/bundle

# deploy example mission app (https://robinfo.bigbang.dev) which auto creates client + authservice config
make deploy/podinfo 
```

