# SBOM Tools Quick Reference Card

## 🔍 Syft - SBOM Generation

### Basic Usage
```bash
syft <source> -o <format>
```

### Sources
| Source | Example |
|--------|---------|
| Container Image | `syft alpine:latest` |
| Directory | `syft dir:.` |
| Archive | `syft file://archive.tar.gz` |

### Output Formats
| Format | Flag |
|--------|------|
| SPDX JSON | `-o spdx-json` |
| SPDX Tag-Value | `-o spdx-tag-value` |
| CycloneDX JSON | `-o cyclonedx-json` |
| Syft JSON | `-o json` |
| Table | `-o table` |

### Common Commands
```bash
# Generate SPDX SBOM
syft alpine:latest -o spdx-json > sbom.json

# Generate CycloneDX SBOM
syft dir:. -o cyclonedx-json > bom.json

# Quick table view
syft alpine:latest -o table
```

---

## 🛡️ Grype - Vulnerability Scanner

### Basic Usage
```bash
grype <source>
```

### Severity Levels
- `negligible`
- `low`
- `medium`
- `high`
- `critical`

### Common Commands
```bash
# Scan container image
grype nginx:latest

# Scan with fail threshold
grype alpine:latest --fail-on high

# JSON output
grype dir:. -o json

# Scan SBOM file
grype sbom:./sbom.json
```

### Database Management
```bash
# Update vulnerability database
grype db update

# Check database status
grype db status
```

---

## 📦 cdxgen - CycloneDX Generator

### Basic Usage
```bash
cdxgen -o bom.json
```

### Project Types
| Type | Flag |
|------|------|
| Python | `-t python` |
| Node.js | `-t nodejs` |
| Java | `-t java` |
| Go | `-t go` |
| .NET | `-t dotnet` |

### Common Commands
```bash
# Auto-detect project type
cdxgen -o bom.json

# Specific project type
cdxgen -t python -o bom.json

# Include evidence
cdxgen --evidence -o bom.json

# Recursive scan
cdxgen -r -o bom.json
```

---

## 📊 Comparison Chart

| Feature | Syft | Grype | cdxgen |
|---------|------|-------|--------|
| Generate SBOM | ✅ | ❌ | ✅ |
| Scan Vulnerabilities | ❌ | ✅ | ❌ |
| SPDX Format | ✅ | ❌ | ❌ |
| CycloneDX Format | ✅ | ❌ | ✅ |
| Container Images | ✅ | ✅ | ❌ |
| Source Code | ✅ | ✅ | ✅ |

---

## 🔄 Common Workflows

### Generate and Scan
```bash
# Create SBOM then scan it
syft alpine:latest -o json > alpine.json
grype sbom:alpine.json
```

### Compare Formats
```bash
# Same source, different formats
syft dir:. -o spdx-json > sbom-spdx.json
syft dir:. -o cyclonedx-json > sbom-cdx.json
cdxgen -o bom-cdxgen.json
```

### Full Analysis
```bash
# Complete analysis of an image
syft nginx:latest -o json > nginx-sbom.json
grype nginx:latest > nginx-vulns.txt
grype nginx:latest -o json > nginx-vulns.json
```

---

## 💡 Tips & Tricks

### Syft
- Use `-q` for quiet mode (errors only)
- Use `-v` for verbose output
- Export specific package types with `--select-catalogers`

### Grype
- Cache is stored in `~/.cache/grype/`
- Update database regularly with `grype db update`
- Use `--only-fixed` to show only fixable vulnerabilities

### cdxgen
- Works best in project root directory
- Supports multiple package managers simultaneously
- Use `--server` for GraphQL server mode

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| Grype database error | Run `grype db update` |
| Syft can't find packages | Check you're in the right directory |
| cdxgen no output | Ensure package files exist (package.json, requirements.txt, etc.) |
| Permission denied | Check file/directory permissions |
| Network timeout | Check internet connectivity |

---

## 📚 Resources

- **Syft**: https://github.com/anchore/syft
- **Grype**: https://github.com/anchore/grype
- **cdxgen**: https://github.com/CycloneDX/cdxgen
- **SPDX**: https://spdx.dev
- **CycloneDX**: https://cyclonedx.org

---

*BSides Munich 2025 - SBOM Workshop*
