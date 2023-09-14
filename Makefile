cluster/create:
	k3d cluster delete -c k3d.yaml
	k3d cluster create -c k3d.yaml

cluster/bundle: cluster/create build/bundle build/podinfo deploy/bundle deploy/podinfo

build:
	mkdir -p build

build/podinfo:
	zarf package create packages/robinfo --confirm -o build

build/bundle: 
	uds bundle create --confirm

deploy/bundle:
	uds bundle deploy uds-bundle-uds-core-k3d-amd64-0.0.1.tar.zst --confirm

deploy/podinfo:
	cd build && zarf package deploy zarf-package-robinfo-amd64-6.0.0-bb.7.tar.zst --confirm