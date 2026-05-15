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
