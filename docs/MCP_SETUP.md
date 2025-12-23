# MCP Setup Guide: OpenCode vs Claude Code

## Overview

Model Context Protocol (MCP) allows AI assistants to access external tools and data sources. This guide covers how MCP works in OpenCode and Claude Code, with Context7 as the example.

## What is Context7?

Context7 is an MCP server that provides **up-to-date documentation** for libraries and frameworks directly in your AI coding assistant. Instead of relying on the LLM's training data (which may be outdated), Context7 fetches current documentation.

### Context7 Tools

1. **resolve-library-id** - Converts a library name to a Context7 ID
   - Example: "next.js" → `/vercel/next.js`

2. **get-library-docs** - Fetches documentation for a library
   - Parameters: library ID, optional topic, optional page number
   - Example: `/supabase/supabase` with topic "authentication"

## Configuration Comparison

### OpenCode Configuration

**Location**: `~/.config/opencode/opencode.json`

**Remote Server (Recommended)**:
```json
{
    "$schema": "https://opencode.ai/config.json",
    "mcp": {
        "context7": {
            "type": "remote",
            "url": "https://mcp.context7.com/mcp",
            "enabled": true,
            "headers": {
                "CONTEXT7_API_KEY": "YOUR_API_KEY"
            }
        }
    }
}
```

**Local Server**:
```json
{
    "mcp": {
        "context7": {
            "type": "local",
            "command": ["npx", "-y", "@upstash/context7-mcp"],
            "enabled": true,
            "environment": {
                "CONTEXT7_API_KEY": "YOUR_API_KEY"
            }
        }
    }
}
```

**Key Features**:
- Can enable/disable globally via `"enabled": true/false`
- Can disable per-tool using glob patterns in `tools` section
- Can enable per-agent in agent configurations
- Supports timeout configuration

### Claude Code Configuration

**Setup via CLI**:

**Remote Server**:
```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp \
  --header "CONTEXT7_API_KEY: YOUR_API_KEY"
```

**Local Server**:
```bash
claude mcp add context7 -- npx -y @upstash/context7-mcp --api-key YOUR_API_KEY
```

**Management Commands**:
```bash
# List all MCP servers
claude mcp list

# Remove a server
claude mcp remove context7

# Check server status
claude mcp status context7
```

**Key Features**:
- Configuration managed via CLI (not config files)
- Supports both HTTP and stdio transports
- Built-in health checking
- OAuth support for authenticated servers

## Key Differences

| Feature | OpenCode | Claude Code |
|---------|----------|-------------|
| Configuration | JSON file | CLI commands |
| Location | `~/.config/opencode/opencode.json` | Internal database |
| Adding servers | Edit config file | `claude mcp add` |
| Removing servers | Delete from config | `claude mcp remove` |
| Server types | Local (stdio) & Remote (HTTP) | Same |
| Per-agent control | Yes, via agent config | No |
| Global enable/disable | Yes, via `enabled` flag | Remove/add server |
| Timeout config | Yes | Yes |
| Environment vars | Via `environment` object | Via CLI args |

## Auto-Invocation Rules

Instead of typing "use context7" in every prompt, add rules to automatically invoke Context7:

### OpenCode

Add to `~/.config/opencode/AGENTS.md` or project-specific `AGENTS.md`:

```markdown
## Documentation & Libraries

Always use context7 MCP tools when you need code generation, setup steps, or library/API documentation. Use context7 to resolve library IDs and fetch up-to-date docs without being asked explicitly.

For specific libraries, use the slash syntax (e.g., `/nextjs/docs`, `/supabase/supabase`) to skip resolution step.
```

### Claude Code

Add to `~/.claude/CLAUDE.md` or project-specific `CLAUDE.md`:

```markdown
## Documentation & Libraries

Always use context7 MCP tools when you need code generation, setup steps, or library/API documentation. Use context7 to resolve library IDs and fetch up-to-date docs without being asked explicitly.

For specific libraries, use the slash syntax (e.g., `/nextjs/docs`, `/supabase/supabase`) to skip resolution step.
```

## API Keys

**Without API Key**:
- Basic usage with rate limits
- Public repositories only
- Good for trying out Context7

**With API Key**:
- Higher rate limits
- Access to private repositories (if configured)
- Better performance
- Get yours at: https://context7.com/dashboard

## Usage Examples

### Basic Usage

```
Create a Next.js middleware that checks for JWT authentication
```

With the auto-invocation rule, Context7 will automatically fetch Next.js docs.

### Explicit Library Specification

```
Implement Supabase authentication using library /supabase/supabase
```

This skips the resolution step and directly fetches Supabase docs.

### Focused Documentation

```
Get Supabase authentication docs on topic "email authentication"
```

Context7 will focus on the specific topic within the library.

### Pagination

```
Get Next.js routing docs, page 2
```

Use pagination if the first page doesn't have enough context.

## Troubleshooting

### OpenCode

**MCP server not loading**:
1. Check `enabled: true` in config
2. Verify JSON syntax is correct
3. Check OpenCode logs for errors
4. Ensure the URL is correct for remote servers
5. For local servers, verify npx/node is in PATH

**Tools not appearing**:
1. Check if tools are disabled globally in `tools` section
2. Verify MCP server is actually running
3. Check timeout settings (increase if needed)

### Claude Code

**Server not connecting**:
```bash
# Check status
claude mcp list

# Try removing and re-adding
claude mcp remove context7
claude mcp add context7 -- npx -y @upstash/context7-mcp
```

**Authentication issues**:
```bash
# For remote servers with OAuth
claude mcp auth context7
```

## Advanced Configuration

### Per-Agent Control (OpenCode Only)

Disable Context7 globally but enable for specific agents:

```json
{
    "mcp": {
        "context7": {
            "type": "remote",
            "url": "https://mcp.context7.com/mcp",
            "enabled": true
        }
    },
    "tools": {
        "context7*": false
    },
    "agent": {
        "frontend-specialist": {
            "tools": {
                "context7*": true
            }
        }
    }
}
```

### Using Environment Variables

Both systems support environment variables for API keys:

**OpenCode**:
```json
{
    "mcp": {
        "context7": {
            "type": "remote",
            "url": "https://mcp.context7.com/mcp",
            "headers": {
                "CONTEXT7_API_KEY": "{env:CONTEXT7_API_KEY}"
            }
        }
    }
}
```

**Claude Code**:
Set `CONTEXT7_API_KEY` environment variable before running `claude mcp add`.

### Proxy Configuration

Context7 respects `https_proxy` and `HTTPS_PROXY` environment variables for proxy connections.

## Your Current Setup

### OpenCode
- **Status**: ✅ Configured
- **Type**: Remote HTTP server
- **Location**: `~/code/yuyudhan/yuyudhan-dotfiles/opencode/opencode.json`
- **Auto-rules**: ✅ Added to `AGENTS.md`

### Claude Code
- **Status**: ✅ Already configured
- **Type**: Remote HTTP server (https://mcp.context7.com/mcp)
- **Auto-rules**: ✅ Added to `~/.claude/CLAUDE.md`

## Next Steps

1. **Get an API key** (optional): Visit https://context7.com/dashboard
2. **Add API key to configs** if you want higher rate limits
3. **Test the setup**: Ask the AI assistant for library documentation
4. **Explore other MCP servers**: Check https://opencode.ai/docs/mcp-servers/

## Resources

- OpenCode MCP Docs: https://opencode.ai/docs/mcp-servers/
- Claude Code MCP Docs: https://docs.anthropic.com/en/docs/claude-code/mcp
- Context7 GitHub: https://github.com/upstash/context7
- Context7 Website: https://context7.com
- MCP Protocol: https://modelcontextprotocol.io/
