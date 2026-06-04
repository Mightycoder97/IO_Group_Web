# IO_Group_Web — Agent Instructions

## RTK Usage (Token Savings)

All shell operations must go through `rtk` to track token savings. The `rtk` plugin is active and wraps all bash commands with `rtk proxy`.

### File Operations
Prefer `rtk` subcommands via bash instead of native tools:

| Instead of        | Use                                      |
|-------------------|------------------------------------------|
| `read` tool       | `rtk read <file>`                        |
| `grep` tool       | `rtk grep <pattern> <path>`              |
| `glob` tool       | `rtk find <path> -name "<pattern>"`      |
| `edit` tool       | `rtk read <file>` then `edit` tool       |

### Command Execution
- All bash/shell commands are automatically wrapped by the `rtk` plugin via `rtk rewrite` + `rtk proxy`.
- Do NOT manually add `rtk` prefix to bash commands — the plugin handles it.
- The only exception is when using `rtk` subcommands directly (`rtk read`, `rtk grep`, `rtk find`, etc.) instead of native tools.

### Verification
- Run `rtk gain` periodically to verify savings are being tracked.

## Clean Repository Guidelines

To keep the repository clean and avoid committing large binaries, office documents, or developer-specific tools, the following folders are structured and ignored in `.gitignore`:

### 1. `excel_data/` (Ignored)
- **Purpose**: Contains all raw and backup Excel worksheets (`.xlsx`, `.xlsm`, etc.) used as sources for data migrations and audits.
- **Rules**: Never commit any Excel sheets to Git. Keep them strictly in this folder.

### 2. `extraction_tools/` (Ignored)
- **Purpose**: Stores helper/auxiliary scripts (`.py`, `.ps1`, `.php`) used for parsing, processing, matching, and executing migrations.
- **Rules**: Keep extraction logic and debug utilities separated from the application's runtime code here.

### 3. `docs/` (Ignored)
- **Purpose**: Stores office documents, contract templates (`.docx`, `.pdf`), and reference materials.
- **Rules**: Keep them locally for reference. Never commit them to Git.

### 4. `templates/` (Ignored)
- **Purpose**: Stores layout designs, newsletters, or email templates (`.html`).
- **Rules**: Keep them locally. Never commit them to Git.

### General Clean Repository Rules:
- **No Temporary Files**: Text files with logs, scrapes, lists, or temporary audit results (`*.txt`) must never be committed to Git.
- **Root Directory Cleanliness**: The project root must only contain active production code/routing configuration (`.htaccess`, `.gitignore`, `.env.example`, and html public pages).
- **Run commands**: All extraction scripts must be executed from the repository root, e.g.:
  - **Extraction**: `python3 extraction_tools/extract_servicios_2026_lima_sur.py`
  - **Import execution (Dry-run)**: `php extraction_tools/run_services_import.php`
  - **Import execution (Production)**: `php extraction_tools/run_services_import.php --commit`
