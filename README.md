<div align="center">
  <img border-radius="25px" max-height="250px" src="./banner.png" />
  <h1>Registry: Deployments+ABIs</h1>
  <p>
    <strong>by <a href="https://astrolab.fi">Astrolab<a></strong>
  </p>
  <p>
    <!-- <a href="https://github.com/AstrolabFinance/registry/actions"><img alt="Build Status" src="https://github.com/AstrolabFinance/registry/actions/workflows/tests.yaml/badge.svg" /></a> -->
    <a href="https://opensource.org/licenses/MIT"><img alt="License" src="https://img.shields.io/github/license/AstrolabFinance/registry?color=3AB2FF" /></a>
    <a href="https://discord.gg/PtAkTCwueu"><img alt="Discord Chat" src="https://img.shields.io/discord/984518964371673140"/></a>
    <a href="https://docs.astrolab.fi"><img alt="Astrolab Docs" src="https://img.shields.io/badge/astrolab_docs-F9C3B3" /></a>
  </p>
</div>

This repository is Astrolab's deployment registry, you can find here the historically deployed contract addresses, deployers, and ABIs.

Example TS Usage:

```typescript
import Erc20 from "@astrolabs/registry/abis/Erc20"; // IAbi
import latest from "@astrolabs/registry/deployments/crate-arbitrum-latest"; // IDeployment
```

## Updates
Updates to this registry are automated upon smart contract compilation and deployment.
