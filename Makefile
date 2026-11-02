# registry.json is built from packages/*/package.yaml; the release carries the zip and
# checksums that mason.nvim downloads.
TAG ?= $(shell date +%Y-%m-%d)

registry.json: $(wildcard packages/*/package.yaml)
	uv run --with pyyaml python -c 'import json,yaml,glob; json.dump([yaml.safe_load(open(f)) for f in sorted(glob.glob("packages/*/package.yaml"))], open("registry.json","w"), indent=2)'

release: registry.json
	rm -f registry.json.zip checksums.txt
	zip -q registry.json.zip registry.json
	shasum -a 256 registry.json registry.json.zip > checksums.txt
	gh release create $(TAG) registry.json.zip checksums.txt --title $(TAG) --notes "registry.json for $(TAG)"

.PHONY: release
