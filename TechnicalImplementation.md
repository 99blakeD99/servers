# Technical Implementation Guide

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![MCP Compatible](https://img.shields.io/badge/MCP-Compatible-green.svg)](https://modelcontextprotocol.io/)
[![Claude 3.5 Sonnet](https://img.shields.io/badge/LLM-Claude%203.5%20Sonnet-blue.svg)](https://www.anthropic.com/claude)

**Comprehensive technical architecture, setup, and development guide for the Universal_FSCompliance_MCP Project - the first MCP-integrated compliance platform for financial services.**

---

## 🏗️ Architecture

**The Universal_FSCompliance_MCP Project follows a layered architecture as the first MCP-integrated compliance platform:**

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   AI Agents     │    │   Universal_FSCompliance_MCP        │    │   Knowledge     │
│  (MCP Clients)  │◄──►│   Server         │◄──►│     Store       │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │                        │
                              ▼                        ▼
                       ┌──────────────┐         ┌─────────────┐
                       │ LLM Gateway  │         │  LightRAG   │
                       │(Claude 3.5)  │         │  Engine     │
                       └──────────────┘         └─────────────┘
```

### Core Layers
1. **MCP Server Layer**: Protocol-compliant JSON-RPC 2.0 server
2. **Knowledge Management Layer**: LightRAG-powered FCA Handbook processing with advanced RAG capabilities
3. **Compliance Intelligence Layer**: AI-powered requirement analysis and gap detection
4. **Memory and Learning Layer**: Long-term memory with privacy controls
5. **LLM Abstraction Layer**: Claude 3.5 Sonnet default with multi-model support (LLaMA 3, Falcon, Mistral Medium)

### Strategic Architecture Decisions
- **LLM Strategy**: Claude 3.5 Sonnet selected as default based on extensive real-world validation (see LLMChoice.md)
- **No Fine-Tuning**: Deliberate decision to use standard LLMs + advanced RAG for optimal flexibility and regulatory responsiveness
- **Database Evolution**: Migrating to Supabase (PostgreSQL + PGVector) for simplified architecture and real-time capabilities
- **MCP Tool Priority**: 6 priority tools identified for Phase 3 implementation (see ComplianceTools.md)

---

## 🚀 Quick Start

### Prerequisites
- Python 3.11 or higher
- [Poetry](https://python-poetry.org/) for dependency management

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/99blakeD99/fscompliance.git
   cd fscompliance
   ```

2. **Install Poetry** (if not already installed)
   ```bash
   curl -sSL https://install.python-poetry.org | python3 -
   ```

3. **Install dependencies**
   ```bash
   poetry install
   ```

4. **Activate virtual environment**
   ```bash
   poetry shell
   ```

5. **Start the MCP server**
   ```bash
   poetry run python -m fscompliance.server
   ```

### Development Setup

```bash
# Install development dependencies
poetry install --with dev

# Set up pre-commit hooks
poetry run pre-commit install

# Run tests
poetry run pytest

# Format code
poetry run black .

# Lint code
poetry run ruff check .
```

---

## 📖 Usage

> **Note**: The following examples are conceptual and demonstrate the intended API design. Actual implementation may vary as development progresses. For current functionality, refer to the MCP integration examples below.

### Basic Compliance Query (Conceptual)

```python
from fscompliance import FSComplianceClient

client = FSComplianceClient()

# Analyze policy for compliance gaps
response = client.analyze_policy(
    policy_text="Our investment advisory process...",
    query_type="gap_analysis"
)

print(f"Identified {len(response.gaps_identified)} compliance gaps")
for gap in response.gaps_identified:
    print(f"- {gap.description} (FCA: {gap.regulation_reference})")
```

### Customer Risk Assessment (Conceptual)

```python
# Validate customer scenario
response = client.assess_customer_scenario(
    scenario="60+ year old customers holding Bitcoin investments",
    requirements=["risk_warnings", "suitability_assessment"]
)

print(f"Compliance Status: {response.compliance_status}")
print(f"Required Actions: {response.recommendations}")
```

### MCP Integration

The Universal_FSCompliance_MCP Project implements the Model Context Protocol, allowing AI agents to interact via standard MCP methods:

```json
{
  "jsonrpc": "2.0",
  "method": "tools/call",
  "params": {
    "name": "analyze_compliance",
    "arguments": {
      "policy_text": "Investment advisory procedures...",
      "analysis_type": "gap_analysis"
    }
  }
}
```

---

## 🔧 Configuration

### Environment Variables

```bash
# LLM Configuration
FSCOMPLIANCE_DEFAULT_LLM=claude-3.5-sonnet
FSCOMPLIANCE_CLAUDE_API_KEY=your_anthropic_api_key
FSCOMPLIANCE_ENABLE_MULTI_MODEL=true

# Database Configuration (Supabase Migration Planned)
FSCOMPLIANCE_DB_URL=postgresql://user:pass@localhost/fscompliance
FSCOMPLIANCE_VECTOR_STORE=pgvector

# Privacy Settings
FSCOMPLIANCE_MEMORY_ENABLED=true
FSCOMPLIANCE_ANONYMIZE_DATA=true
FSCOMPLIANCE_AUDIT_LOGGING=true

# MCP Server Settings
FSCOMPLIANCE_MCP_PORT=8000
FSCOMPLIANCE_MCP_HOST=localhost
```

### Privacy Controls

The Universal_FSCompliance_MCP Project includes comprehensive privacy controls:

- **Memory Management**: Enable/disable long-term learning
- **Data Anonymization**: Automatic PII detection and masking
- **Local Processing**: On-premises deployment options
- **Audit Logging**: Complete compliance decision tracking

---

## 🧪 Testing

> **Note**: Test structure may vary during development. Refer to actual project structure for current test organization.

```bash
# Run all tests
poetry run pytest

# Run with coverage
poetry run pytest --cov=fscompliance

# Run specific test categories (examples)
poetry run pytest tests/compliance/
poetry run pytest tests/mcp/
poetry run pytest -m "not integration"
```

---

## 🤝 Contributing

We welcome contributions! Please see our contributing guidelines:

1. **Check Tasks.md** for current development priorities
2. **Follow Rules.md** for coding standards and conventions
3. **Create comprehensive tests** for all new features
4. **Update documentation** when adding features or changing APIs

### Development Workflow

```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes following Rules.md guidelines
# Add/update tests
poetry run pytest

# Format and lint
poetry run black .
poetry run ruff check .

# Update Tasks.md with completed work
# Submit pull request
```

---

## 🔒 Security

The Universal_FSCompliance_MCP Project handles sensitive financial data and implements:

- **OAuth 2.1 Authentication**: Secure API access
- **TLS Encryption**: All communications encrypted
- **Input Validation**: Comprehensive data validation using Pydantic
- **Audit Logging**: Complete access and decision logging
- **Role-Based Access**: Granular permission system

### Security Reporting

Please report security vulnerabilities privately to: security@jbmd.co.uk

---

## 📞 API Documentation

Once running, visit:
- **OpenAPI Docs**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc
- **MCP Schema**: http://localhost:8000/mcp/schema

---

## About This Document

**Author**: Blake Dempster, Founder, CEO, Principal Architect  
**Co-Authored by**: Claude Code (claude.ai/code)  
**Created**: 9 July 2025  
**Date last reviewed formally by ReviewRules.md**: 9 July 2025  
**Purpose**: Comprehensive technical implementation guide for the Universal_FSCompliance_MCP Project, covering architecture, setup, development, and deployment.

*This document provides the technical foundation for implementing, deploying, and contributing to the Universal_FSCompliance_MCP Project - the first MCP-integrated compliance platform for financial services.*

---