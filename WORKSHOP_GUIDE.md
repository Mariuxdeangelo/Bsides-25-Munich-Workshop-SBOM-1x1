# Workshop Guide: SBOM 1x1

Welcome to the BSides Munich 2025 SBOM Workshop! This guide will help you get started with Software Bill of Materials (SBOM) generation and vulnerability scanning.

## What is an SBOM?

A Software Bill of Materials (SBOM) is a comprehensive inventory of all components, libraries, and modules that make up a software application. It's similar to an ingredients list on food packaging but for software.

## Getting Started

### Step 1: Launch Your Environment

Choose one of these options:

**Option A: GitHub Codespaces (Easiest)**
1. Fork this repository
2. Click the green "Code" button
3. Select "Codespaces" tab
4. Click "Create codespace on main"
5. Wait 2-3 minutes for setup

**Option B: Local Dev Container**
1. Install Docker Desktop and VS Code with Dev Containers extension
2. Clone your fork locally
3. Open in VS Code and select "Reopen in Container"

### Step 2: Verify Tool Installation

Once your environment is ready, open a terminal and run:

```bash
syft version
grype version
cdxgen --version
```

All three commands should display version information.

## Workshop Exercises

### Exercise 1: Generate Your First SBOM

Let's start with a simple container image:

```bash
# Generate SBOM in SPDX JSON format
syft alpine:latest -o spdx-json > alpine-sbom.json

# View the SBOM (first 50 lines)
head -50 alpine-sbom.json

# Generate in CycloneDX format
syft alpine:latest -o cyclonedx-json > alpine-cdx.json
```

**Questions to explore:**
- How many packages are in Alpine Linux?
- What's the difference between SPDX and CycloneDX formats?

### Exercise 2: Scan for Vulnerabilities

Now let's check for security issues:

```bash
# Scan the Alpine image
grype alpine:latest

# Scan with specific severity filter
grype alpine:latest --fail-on high
```

**Questions to explore:**
- Are there any critical vulnerabilities?
- What CVEs were found?
- Which packages are affected?

### Exercise 3: Analyze Application Dependencies

Navigate to one of the example applications:

```bash
cd examples/python-app

# Generate SBOM for the Python app
syft dir:. -o json > app-sbom.json

# Scan for vulnerabilities
grype dir:.

# Generate CycloneDX SBOM with cdxgen
cdxgen -t python -o app-bom.json
```

Try the same with the Node.js application:

```bash
cd ../node-app

# Generate and scan
syft dir:. -o json > node-sbom.json
grype dir:.
cdxgen -o node-bom.json
```

### Exercise 4: Compare SBOM Formats

Generate the same application's SBOM in different formats:

```bash
cd examples/python-app

# SPDX JSON
syft dir:. -o spdx-json > sbom-spdx.json

# CycloneDX JSON
syft dir:. -o cyclonedx-json > sbom-cdx.json

# SPDX Tag-Value
syft dir:. -o spdx-tag-value > sbom-spdx.txt
```

Compare the files:
- Which format is more human-readable?
- Which contains more metadata?
- Which would you prefer for automation?

### Exercise 5: Advanced Scanning

Try scanning different container images:

```bash
# Scan a Python image
grype python:3.9

# Scan an nginx image
grype nginx:latest

# Scan a specific version
grype ubuntu:20.04
```

## Tool Reference

### Syft Commands

```bash
# Basic SBOM generation
syft <source> -o <format>

# Supported sources
syft alpine:latest          # Container image
syft dir:.                  # Directory
syft file:///path/to/file   # File

# Output formats
-o json                     # Syft JSON
-o spdx-json               # SPDX JSON
-o cyclonedx-json          # CycloneDX JSON
-o table                   # Human-readable table
```

### Grype Commands

```bash
# Basic vulnerability scan
grype <source>

# Scan with severity filter
grype <source> --fail-on <severity>
# Severities: negligible, low, medium, high, critical

# Output formats
grype <source> -o json     # JSON output
grype <source> -o table    # Table (default)
grype <source> -o template # Custom template
```

### cdxgen Commands

```bash
# Generate CycloneDX SBOM
cdxgen -o bom.json

# Specify project type
cdxgen -t python -o bom.json
cdxgen -t nodejs -o bom.json

# Generate with evidence
cdxgen --evidence -o bom.json
```

## Common Issues

### Grype Database Update

On first run, Grype needs to download its vulnerability database:

```bash
grype db update
```

This happens automatically but may take a minute with slow connections.

### Permission Errors

If you encounter permission issues with Docker:

```bash
# Add your user to docker group (requires re-login)
sudo usermod -aG docker $USER
```

### Network Issues

Some corporate networks may block container registry access. Contact your workshop facilitator if you cannot pull images.

## Best Practices

1. **Generate SBOMs regularly**: Ideally in your CI/CD pipeline
2. **Track dependencies**: Keep SBOMs under version control
3. **Scan frequently**: Check for new vulnerabilities regularly
4. **Update dependencies**: Address critical vulnerabilities promptly
5. **Use automation**: Integrate SBOM generation into your build process

## Additional Resources

- [Syft Documentation](https://github.com/anchore/syft)
- [Grype Documentation](https://github.com/anchore/grype)
- [cdxgen Documentation](https://github.com/CycloneDX/cdxgen)
- [SPDX Specification](https://spdx.dev/)
- [CycloneDX Specification](https://cyclonedx.org/)
- [CISA SBOM Resources](https://www.cisa.gov/sbom)

## Workshop Support

If you encounter any issues during the workshop:
1. Check this guide first
2. Ask your neighbor
3. Raise your hand for facilitator assistance
4. Post in the workshop chat

## Next Steps

After the workshop:
1. Fork this repository to keep experimenting
2. Try generating SBOMs for your own projects
3. Integrate SBOM generation into your CI/CD
4. Share your experiences with your team

Happy SBOM exploration! 🔍
