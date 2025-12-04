Purpose: Convert indentation in provided file(s) to 4-space standard.

Input: File path(s) or code context requiring indentation standardization.

Rules:
- Convert tabs to 4 spaces
- Convert 2-space indentation to 4 spaces
- Preserve relative indentation depth (nested structures scale proportionally)
- Maintain indentation within string literals unchanged
- Keep heredocs, template literals, and multi-line strings as-is

Edge Cases:
- Mixed indentation: Normalize to 4 spaces based on semantic structure
- Alignment spaces (e.g., multi-line parameter lists): Convert structural indentation only, preserve intentional alignment
- Language-specific: Respect language conventions (Python requires consistency, Makefiles require tabs - DO NOT convert Makefiles)

Exceptions (DO NOT MODIFY):
- Makefiles (require tabs)
- `.editorconfig` or project-specific indent configs if present
- Files with explicit indent markers (e.g., `// indent: tabs`)
- Binary or generated files

Verification:
- Check syntax remains valid after conversion
- Confirm no whitespace-sensitive code breaks
- Report total lines modified and indentation depth changes

Output:
- Brief summary: files modified, indentation changes applied
- Flag any files skipped with reason
