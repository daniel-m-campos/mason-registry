# mason-registry

A small [mason.nvim](https://github.com/mason-org/mason.nvim) registry for packages that
are not in the official one yet.

| Package | What it is |
|---|---|
| `sqls-duckdb` | [sqls](https://github.com/sqls-server/sqls) built with DuckDB support, from the [fork](https://github.com/daniel-m-campos/sqls) while the driver is upstreamed. Needs Go and a C compiler (clang on macOS, MinGW gcc on Windows). |

```lua
require('mason').setup({
  registries = {
    'github:daniel-m-campos/mason-registry',
    'github:mason-org/mason-registry',
  },
})
```

`make release` generates `registry.json` from `packages/*/package.yaml` and publishes the
GitHub release mason.nvim downloads (`registry.json.zip` and `checksums.txt`).
