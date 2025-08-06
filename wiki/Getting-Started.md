# Getting Started

This page walks you through setting up a new project from the Secure Supply Chain Scanner Template.

## 1. Create a New Repository

Click **Use this template** on the [template repository](https://github.com/tbowman01/secure-repo-template) or visit the URL `https://github.com/tbowman01/secure-repo-template/generate`.  Give your new repository a name and visibility.

## 2. Enable GitHub Workflows

Workflows are stored in `.github/workflows`.  By default they run on pushes to the `main` branch.  To trigger scans manually, go to the **Actions** tab in your repository and select **Run workflow**.

## 3. Install Local Dependencies

To run the product‑requirements workflow locally:

```sh
npm install -g claude-flow
make prd
```

To execute all local scans, run:

```sh
make scan-all
```

## 4. Publish Documentation

All Markdown files under the `wiki/` directory are synchronized to your GitHub Wiki via the `publish-wiki` workflow.  Edit these files and push them to update the public wiki.
