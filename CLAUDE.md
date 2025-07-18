# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a yasnippet collection for Emacs - a comprehensive set of code snippets organized by programming language and framework. Yasnippets are templates that expand into code when triggered by keywords in Emacs.

## Architecture

The repository is structured as a flat directory hierarchy where each subfolder corresponds to an Emacs major mode:

- **Language modes**: `c-mode/`, `python-mode/`, `typescript-mode/`, `zig-mode/`, `rust-mode/`, etc.
- **Framework/library modes**: `glsl-mode/`, `rjsx-mode/`, `vue-mode/`, `processing-mode/`
- **Markup modes**: `html-mode/`, `mhtml-mode/`, `json-mode/`, `org-mode/`
- **Build system modes**: `cmake-mode/`
- **Specialized modes**: `snippet-mode/`, `emacs-lisp-mode/`

## Snippet File Format

Each snippet file follows yasnippet syntax:
```
# -*- mode: snippet -*-
# name: [descriptive name]
# key: [trigger keyword]
# --
[template content with $0, $1, etc. placeholders]
```

Key placeholders:
- `$0` - final cursor position
- `$1`, `$2`, etc. - tab-stop positions
- `${1:default}` - tab-stop with default value

## Common Patterns

### Graphics Programming
- **Three.js**: Comprehensive WebGL setup with camera, renderer, and scene management
- **GLSL**: Shader templates for fragment/vertex shaders, utility functions, and WebGL integration
- **p5.js**: Processing-style creative coding templates

### System Programming
- **Zig**: Modern systems programming with proper memory management patterns
- **Rust**: Safe systems programming with Nannou creative coding framework
- **C/C++**: Low-level programming and OpenFrameworks creative coding

### Web Development
- **TypeScript**: Modern JavaScript with type safety, React components, and build configurations
- **Vite**: Build system configurations for different frameworks and plugins
- **React/JSX**: Component templates and hooks

### Development Workflow
- Build configurations are primarily handled through Vite for web projects
- No unified test runner - testing depends on the specific language/framework
- Snippets focus on boilerplate reduction and common patterns

## Special Directories

- `touchdesigner/` - Specialized Python snippets for TouchDesigner creative coding
- `thi.ng/` - Snippets for the thi.ng creative coding ecosystem
- `fs/` - File system operation snippets

## Usage Notes

When adding new snippets:
1. Use descriptive names and appropriate trigger keywords
2. Include common imports and boilerplate setup
3. Place cursor at logical editing positions with `$0`
4. Use tab-stops (`$1`, `$2`) for user customization points
5. Follow existing patterns within each language mode