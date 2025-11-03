# Bsides-25-Munich-Workshop-SBOM-1x1

This is a setup for the Bsides 25 Munich Workshop: SBOM 1x1 that participants can use to test the different tools that are presented in the workshop.

## 🚀 Quick Start

This repository provides a pre-configured development environment with SBOM (Software Bill of Materials) tools installed and ready to use.

### Option 1: GitHub Codespaces (Recommended)

1. Fork this repository to your GitHub account
2. Click the green "Code" button
3. Select "Codespaces" tab
4. Click "Create codespace on main"
5. Wait for the environment to build (first time takes ~2-3 minutes)

### Option 2: VS Code Dev Containers

1. Fork and clone this repository
2. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
3. Install [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
4. Open the cloned folder in VS Code
5. Click "Reopen in Container" when prompted (or use Command Palette: `Dev Containers: Reopen in Container`)

## 🛠️ Pre-installed Tools

The environment comes with the following SBOM tools pre-installed:

### Syft
Generate SBOMs from container images, filesystems, and packages.
```bash
syft <source> -o <format>
# Example: syft alpine:latest -o json
```

### Grype
Scan for vulnerabilities in container images, filesystems, and SBOMs.
```bash
grype <source>
# Example: grype alpine:latest
```

### cdxgen
Generate CycloneDX SBOMs for various project types.
```bash
cdxgen -o bom.json
# Example: cdxgen -t python -o bom.json
```

## 📚 Workshop Resources

During the workshop, you'll learn to:
- Generate SBOMs using different tools
- Compare SBOM formats (SPDX vs CycloneDX)
- Scan for vulnerabilities
- Integrate SBOM generation into CI/CD pipelines

## 💡 Getting Help

- Check tool versions: `syft version`, `grype version`, `cdxgen --version`
- Tool documentation:
  - [Syft Documentation](https://github.com/anchore/syft)
  - [Grype Documentation](https://github.com/anchore/grype)
  - [cdxgen Documentation](https://github.com/CycloneDX/cdxgen)

## ✅ Verify Your Setup

Once your environment is ready, run:

```bash
./verify-setup.sh
```

This will check that all tools are properly installed.

## 🧪 Try It Out

Quick test commands:

```bash
# Check all tools are installed
syft version
grype version
cdxgen --version

# Generate an SBOM of a container image
syft alpine:latest -o json > alpine-sbom.json

# Scan for vulnerabilities
grype alpine:latest

# Generate a CycloneDX SBOM (if you have a project)
cdxgen -o project-bom.json
```

## 📖 Documentation

- **[Workshop Guide](WORKSHOP_GUIDE.md)** - Comprehensive guide with exercises and examples
- **[Quick Reference](QUICK_REFERENCE.md)** - Command cheat sheet for all tools
- **[Examples](examples/)** - Sample applications to practice with

## 🔒 Security Note

The devcontainer setup uses official installation scripts from Anchore (syft, grype) and npm (cdxgen). These are the recommended installation methods from each tool's official documentation. The environment is intended for educational purposes in a workshop setting.

## 🤝 Contributing

This is a workshop environment. Feel free to experiment and modify as needed!
