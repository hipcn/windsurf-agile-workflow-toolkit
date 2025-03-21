# Windsurf Auto Rules Generation and Agile Workflow Templates

English | [简体中文](README.md)

> This project is adapted from [cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) for Windsurf. Special thanks to [@bmadcode](https://github.com/bmadcode) for their excellent work.

**Important Update**

Windsurf, as a revolutionary AI programming IDE, provides unique rule generation and management mechanisms. This template aims to help developers quickly establish and maintain AI code generation rules through natural language.

> 💡 **Note:** For a complete guide to the Windsurf agile workflow system, please refer to the [Agile Workflow Documentation](docs/agile-readme.en.md).

## Core Features

Through fine-grained rules and customized workflows, you can fully leverage the potential of Windsurf AI agents. This template ensures:

- Rules are automatically and accurately applied
- Support for precise rule usage on demand
- Continuous optimization of AI agent learning and improvement capabilities

## Quick Start

### Method 1: Interactive Initialization (Recommended)

```bash
# Windows PowerShell
git clone https://github.com/hipcn/windsurf-agile-workflow-toolkit.git
cd windsurf-agile-workflow-toolkit
.\init-project.ps1

# Linux/Mac
git clone https://github.com/hipcn/windsurf-agile-workflow-toolkit.git
cd windsurf-agile-workflow-toolkit
chmod +x init-project.sh
./init-project.sh
```

The interactive initialization script will:
- Guide you through project information input
- Automatically create necessary directory structures
- Copy and configure all templates
- Initialize Git repository
- Provide next steps guidance

### Method 2: Manual Configuration

```bash
# Windows
.\apply-rules.bat D:\path\to\your\project

# Linux/Mac
./apply-rules.sh /path/to/your/project

Examples:
# Windows
.\apply-rules.bat D:\Projects\openmanus

# Linux/Mac
./apply-rules.sh /home/user/projects/openmanus
```

## Project Structure

```
your-project/
├── .ai/                    # AI development workspace
├── .windsurf/             # Windsurf configuration and templates
│   └── templates/         # Project templates
│       ├── template-prd.md     # Product Requirements Document template
│       ├── template-arch.md    # Architecture Design Document template
│       └── template-story.md   # User Story template
├── xnotes/                # Project notes and documentation
└── .gitignore            # Git ignore configuration
```

## Usage

1. Choose your preferred initialization method (interactive or manual)
2. Follow the prompts to complete project setup
3. Start using AI agents to manage your project!

## FAQ

### How do I start a new project?
Using the interactive initialization script is the simplest way. The script will guide you through all necessary setup steps.

### How do I migrate an existing project?
1. Clone this repository
2. Run the interactive initialization script
3. Choose your existing project directory
4. Follow the prompts to complete migration

### What if I encounter issues?
- Check the [Agile Workflow Documentation](docs/agile-readme.en.md)
- Look at examples in `.windsurf/templates`
- Open an issue in the repository

## Acknowledgments and License

### Project Origin
This project is adapted from [cursor-auto-rules-agile-workflow](https://github.com/bmadcode/cursor-auto-rules-agile-workflow) for Windsurf. We express our sincere gratitude to [@bmadcode](https://github.com/bmadcode), whose work laid the important foundation for this project.

### Major Improvements
- Migrated workflow tools from Cursor to Windsurf
- Optimized and localized all documentation and templates
- Improved workflow process and rule system
- Enhanced template usability and flexibility
- Added interactive project initialization feature

### License
This project follows the same open source license as the original project. For any license-related questions, please refer to the original project or contact the original author.

## License

MIT
