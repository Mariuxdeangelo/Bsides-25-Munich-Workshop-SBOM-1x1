# Example Applications

This directory contains sample applications that you can use to practice SBOM generation and vulnerability scanning during the workshop.

## Python Application

A simple Flask web application.

### Generate SBOM with Syft
```bash
cd examples/python-app
syft dir:. -o json > python-sbom.json
syft dir:. -o spdx-json > python-sbom-spdx.json
```

### Generate SBOM with cdxgen
```bash
cd examples/python-app
cdxgen -t python -o python-bom.json
```

### Scan for Vulnerabilities with Grype
```bash
cd examples/python-app
grype dir:.
```

## Node.js Application

A simple Express.js web application.

### Generate SBOM with Syft
```bash
cd examples/node-app
syft dir:. -o json > node-sbom.json
```

### Generate SBOM with cdxgen
```bash
cd examples/node-app
cdxgen -o node-bom.json
```

### Scan for Vulnerabilities with Grype
```bash
cd examples/node-app
grype dir:.
```

## Workshop Exercises

1. **Compare SBOM Formats**: Generate SBOMs in different formats (JSON, SPDX, CycloneDX) and compare their structure
2. **Vulnerability Detection**: Scan both applications and identify any vulnerabilities
3. **Container Scanning**: Try scanning popular container images like `alpine:latest`, `nginx:latest`, or `python:3.9`
4. **SBOM Analysis**: Examine the generated SBOMs to understand dependencies and their versions
