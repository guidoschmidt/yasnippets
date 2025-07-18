# Convert Yasnippets to Zed JSON Format

## Overview
This document provides instructions for converting yasnippet collection to Zed editor's JSON snippet format.

## Conversion Process

### Step 1: Folder Structure Analysis
Recursively go through all subfolders and:
- Read all files **without** file extensions (yasnippet files)
- Avoid files **with** file extensions (documentation, configs, etc.)
- Parse the content of each file

### Step 2: JSON Structure Generation
Convert each yasnippet file into this JSON structure:

```json
{
  "$NAME": {
    "prefix": "$KEY",
    "body": [
      "$CONTENTS"
    ],
    "description": "$SUMMARY"
  }
}
```

### Step 3: Field Mapping
- **$NAME**: Extract from "name" property in yasnippet frontmatter
- **$KEY**: Extract from "key" property in yasnippet frontmatter  
- **$CONTENTS**: The template content after the frontmatter (after the `# --` line)
- **$SUMMARY**: Write a very short summary about the snippet's purpose

### Step 4: Output Files
For each subfolder, create a JSON file:
- Remove "-mode" suffix from folder name
- Examples:
  - `zig-mode/` → `zig.json`
  - `typescript-mode/` → `typescript.json`
  - `python-mode/` → `python.json`
  - `c-mode/` → `c.json`
  - `rjsx-mode/` → `rjsx.json`
  - `glsl-mode/` → `glsl.json`

### Step 5: Content Processing
When extracting $CONTENTS:
1. Skip the yasnippet frontmatter (everything before `# --`)
2. Take the template content as-is
3. Split multi-line content into array elements for the "body" field
4. Preserve yasnippet placeholders ($0, $1, ${1:default}, etc.)

## Example Conversion

**Input yasnippet file (zig-mode/alloc):**
```
# -*- mode: snippet -*-
# name: Arena allocator setup
# key: alloc
# --
const std = @import("std");

var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
defer arena.deinit();
const allocator = arena.allocator();

$0
```

**Output JSON (zig.json):**
```json
{
  "Arena allocator setup": {
    "prefix": "alloc",
    "body": [
      "const std = @import(\"std\");",
      "",
      "var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);",
      "defer arena.deinit();",
      "const allocator = arena.allocator();",
      "",
      "$0"
    ],
    "description": "Set up arena allocator with proper deinitialization"
  }
}
```

## Folder Mapping Reference

| Yasnippet Folder | JSON Output File |
|------------------|------------------|
| `c-mode/` | `c.json` |
| `cmake-mode/` | `cmake.json` |
| `emacs-lisp-mode/` | `emacs-lisp.json` |
| `fs/` | `fs.json` |
| `glsl-mode/` | `glsl.json` |
| `html-mode/` | `html.json` |
| `json-mode/` | `json.json` |
| `mhtml-mode/` | `mhtml.json` |
| `org-mode/` | `org.json` |
| `processing-mode/` | `processing.json` |
| `python-mode/` | `python.json` |
| `rjsx-mode/` | `rjsx.json` |
| `rust-mode/` | `rust.json` |
| `snippet-mode/` | `snippet.json` |
| `thi.ng/` | `thing.json` |
| `touchdesigner/` | `touchdesigner.json` |
| `typescript-mode/` | `typescript.json` |
| `vue-mode/` | `vue.json` |
| `zig-mode/` | `zig.json` |

## Implementation Notes

- All JSON files should be placed in the root directory
- Each JSON file contains all snippets from its corresponding mode folder
- Preserve yasnippet placeholder syntax for compatibility
- Handle special characters in JSON strings properly (escape quotes, etc.)
- Multi-line templates should be split into array elements for the "body" field