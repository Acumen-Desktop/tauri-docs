# Gemini Code Assistant Context

## Project Overview

This project is the source code for the Tauri 2.0 documentation website, available at [tauri.app](https://tauri.app). It is a modern, responsive, and feature-rich documentation website built with [Astro](https://astro.build/) and the [Starlight](https://starlight.astro.build/) theme. The website provides comprehensive documentation for Tauri 2.0, including guides, references, and a blog.

The documentation is written in Markdown and is located in the `src/content/docs` directory. The website is built using a combination of Astro components and custom scripts to generate various parts of the documentation, such as the compatibility table, API references, and release notes.

The project is configured to support multiple languages, with English as the primary language. It also includes a number of features to enhance the user experience, such as a dark mode, a search bar, and a service worker for offline access.

## Building and Running

The project uses `pnpm` as its package manager. The following scripts are available in the `package.json` file:

*   **`pnpm dev`**: Starts the development server. This will also automatically set up the necessary submodules and dependencies.
*   **`pnpm build`**: Builds the documentation website for production.
*   **`pnpm preview`**: Previews the built website locally.
*   **`pnpm format`**: Formats the code using Prettier.
*   **`pnpm format:check`**: Checks the code formatting.

To get started, you can run the following command:

```bash
pnpm dev
```

This will start the development server and open the website in your browser at `http://localhost:4321`.

## Development Conventions

The project follows the standard development conventions for Astro and Starlight projects. All code is formatted using Prettier, and the project includes a number of ESLint rules to enforce code quality.

The documentation is written in Markdown and is located in the `src/content/docs` directory. The project uses a number of custom components and scripts to generate the documentation, so it is important to familiarize yourself with the project structure before making any changes.

The project uses a number of Starlight plugins to enhance the user experience. These plugins are configured in the `astro.config.mjs` file.

The project also includes a number of custom scripts for generating different parts of the documentation. These scripts are located in the `packages` directory.
