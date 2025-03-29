<!-- FilePath: LSP.md -->

# LSP & Tooling Overview

This document presents a curated list of language servers, linters, formatters, and related tools that are installed as part of this Neovim configuration. The goal is to use the most common, well‐supported, and conflict‐free tools for each language or domain.

Below you’ll find tables grouped by category. Each table lists the tool (with its alias if applicable), a brief description of what it does, and the reason it’s installed.

---

## Markdown & Text

| **Tool**      | **Alias** | **Description**                                                               | **Reason Installed**                                        |
| ------------- | --------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------- |
| ltex-ls       | ltex      | Language server for grammar, spelling, and style checking in text files.      | Provides natural language and grammar checking in Markdown. |
| textlint      |           | Pluggable linter that enforces writing standards in Markdown and other texts. | Helps enforce quality and consistency in writing.           |
| pymarkdownlnt |           | Markdown linter for common style and formatting issues.                       | Ensures consistent Markdown style.                          |
| glow          |           | Terminal-based Markdown viewer that renders files with styling.               | Enables quick preview of Markdown documents.                |
| doctoc        |           | Automatically generates and updates a table of contents in Markdown files.    | Keeps TOCs up-to-date in long documents.                    |

---

## Ansible

| **Tool**                | **Alias** | **Description**                                                       | **Reason Installed**                                  |
| ----------------------- | --------- | --------------------------------------------------------------------- | ----------------------------------------------------- |
| ansible-language-server | ansiblels | LSP for Ansible playbooks, offering code completions and diagnostics. | Enhances editing and error checking in Ansible files. |

---

## General Code Analysis

| **Tool** | **Alias** | **Description**                        | **Reason Installed**                           |
| -------- | --------- | -------------------------------------- | ---------------------------------------------- |
| ast-grep | ast_grep  | Fast code analysis using AST patterns. | Enables advanced pattern matching across code. |

---

## C/C++ Formatting

| **Tool**     | **Alias** | **Description**                   | **Reason Installed**                               |
| ------------ | --------- | --------------------------------- | -------------------------------------------------- |
| clang-format |           | Formats C/C++ code automatically. | Ensures a consistent code style in C/C++ projects. |

---

## Debugging

| **Tool** | **Alias** | **Description**                                   | **Reason Installed**                            |
| -------- | --------- | ------------------------------------------------- | ----------------------------------------------- |
| codelldb |           | Debug adapter for LLDB, integrated with nvim-dap. | Enables interactive debugging (e.g., for Rust). |
| delve    |           | Debugger for Go programs.                         | Essential for debugging Go code.                |

---

## Docker

| **Tool**                        | **Alias**                       | **Description**                                          | **Reason Installed**                               |
| ------------------------------- | ------------------------------- | -------------------------------------------------------- | -------------------------------------------------- |
| docker-compose-language-service | docker_compose_language_service | Provides language support for docker-compose YAML files. | Enhances editing of docker-compose configurations. |
| dockerfile-language-server      | dockerls                        | LSP for Dockerfiles offering completions and linting.    | Improves the Dockerfile editing experience.        |

---

## JavaScript / TypeScript

| **Tool**                   | **Alias**  | **Description**                                                             | **Reason Installed**                                              |
| -------------------------- | ---------- | --------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| eslint_d                   |            | Fast, daemonized ESLint integration for linting JavaScript/TypeScript code. | Provides real-time linting and error checking.                    |
| standardjs                 |            | Linter enforcing StandardJS style guidelines.                               | Ensures adherence to StandardJS coding style.                     |
| typescript-language-server | ts_ls      | LSP for JavaScript/TypeScript providing completions, navigation, etc.       | Core language server for JS/TS development.                       |
| tsp-server                 | tsp_server | Additional TypeScript server support (if needed).                           | Evaluate its need; if overlapping with ts_ls, it can be optional. |

---

## Go

| **Tool**      | **Alias** | **Description**                                                 | **Reason Installed**                                 |
| ------------- | --------- | --------------------------------------------------------------- | ---------------------------------------------------- |
| goimports     |           | Formats Go code and organizes imports.                          | Ensures consistent formatting and import management. |
| golangci-lint |           | Aggregates multiple Go linters for comprehensive code analysis. | Provides robust linting in a single tool.            |
| gopls         |           | Official Go language server for completions, navigation, etc.   | Primary LSP for Go development.                      |

---

## Lua

| **Tool**            | **Alias** | **Description**                                      | **Reason Installed**                           |
| ------------------- | --------- | ---------------------------------------------------- | ---------------------------------------------- |
| lua-language-server | lua_ls    | LSP for Lua providing completions, diagnostics, etc. | Enhances Lua editing in Neovim configurations. |
| stylua              |           | Formatter for Lua code, ensuring a consistent style. | Maintains clean and consistent Lua code.       |

---

## PostgreSQL

| **Tool**      | **Alias** | **Description**                                               | **Reason Installed**                                  |
| ------------- | --------- | ------------------------------------------------------------- | ----------------------------------------------------- |
| postgrestools |           | Utilities to assist with PostgreSQL queries and schema tasks. | Provides extra functionality for PostgreSQL projects. |

---

## Formatting (General)

| **Tool**      | **Alias** | **Description**                                                        | **Reason Installed**                                  |
| ------------- | --------- | ---------------------------------------------------------------------- | ----------------------------------------------------- |
| prettierd     |           | Daemonized version of Prettier for fast, consistent code formatting.   | Ensures uniform formatting across various file types. |
| pyproject-fmt |           | Formatter for Python projects based on `pyproject.toml` configuration. | Maintains consistent Python code style.               |

---

## Rust

| **Tool**      | **Alias**     | **Description**                                                  | **Reason Installed**                                      |
| ------------- | ------------- | ---------------------------------------------------------------- | --------------------------------------------------------- |
| rust-analyzer | rust_analyzer | Primary Rust LSP providing completions, navigation, diagnostics. | Core language server for Rust development.                |
| rustfmt       |               | Formatter for Rust code.                                         | Ensures adherence to Rust style guidelines.               |
| rustywind     |               | Tool for managing Tailwind CSS classes in code (if applicable).  | Useful in Rust projects that integrate with Tailwind CSS. |

---

## Shell

| **Tool** | **Alias** | **Description**              | **Reason Installed**                            |
| -------- | --------- | ---------------------------- | ----------------------------------------------- |
| shfmt    |           | Formatter for shell scripts. | Ensures consistent formatting in shell scripts. |

---

## Security & Vulnerability Scanning

| **Tool** | **Alias** | **Description**                                                        | **Reason Installed**                                           |
| -------- | --------- | ---------------------------------------------------------------------- | -------------------------------------------------------------- |
| snyk     |           | Scans code and dependencies for known vulnerabilities.                 | Enhances security by detecting potential issues.               |
| trivy    |           | Comprehensive vulnerability scanner for containers and infrastructure. | Provides security insights, especially for containerized apps. |

---

## SQL

| **Tool**      | **Alias** | **Description**                                                      | **Reason Installed**                                          |
| ------------- | --------- | -------------------------------------------------------------------- | ------------------------------------------------------------- |
| sql-formatter |           | Formats SQL queries for improved readability.                        | Enhances readability and consistency in SQL code.             |
| sqlfluff      |           | Linter and formatter for SQL supporting multiple dialects.           | Enforces SQL style guidelines and consistency.                |
| sqlls         |           | SQL language server providing completions and diagnostics.           | Adds LSP features for SQL editing.                            |
| sqls          |           | Alternative SQL language server with similar functionality to sqlls. | Choose one to avoid conflicts; typically, sqlls or sqls only. |

---

## TOML

| **Tool** | **Alias** | **Description**                                                        | **Reason Installed**                                         |
| -------- | --------- | ---------------------------------------------------------------------- | ------------------------------------------------------------ |
| taplo    |           | Language server for TOML files, providing completions and diagnostics. | Ensures a smooth editing experience for TOML configurations. |

---

## Summary

This curated list is designed to provide robust support for various languages and file types without conflicts. For each category, the selected tools were chosen based on their community support, feature set, and ability to work well together. This configuration should help streamline your development workflow in Neovim.

Feel free to adjust or extend these tools as needed to suit your specific project requirements.

