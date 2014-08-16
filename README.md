# Markdown to PDF

*On demand generation of enterprise-grade PDFs from GitHub-hosted markdown files*

[![Build Status](https://travis-ci.org/benbalter/markdown-to-pdf.svg)](https://travis-ci.org/benbalter/markdown-to-pdf) [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Example

* [This file as a PDF](https://github-pdf.herokuapp.com/benbalter/markdown-to-pdf/blob/master/README.pdf)
* [This file as markdown](https://github.com/benbalter/markdown-to-pdf/blob/master/README.md)

## Huh? You're just trollin', right?

Not at all. Markdown may be the *lingua franca* for software and other technical documentation, but many suit-and-tie wearing CIO-types won't take information seriously unless it's presented as a PDF or PowerPoint deck.

With this app you can send them a link to a crisp, clean, "enterprise-grade" PDF, transparently generated on demand from a standard markdown file hosted on GitHub.com.

## Usage

Simply swap `github.com` for your instance's hostname in the path to the blob view of any markdown file on GitHub.com.

Pro-tip: You can swap `.md` for `.pdf` in the URL if you want to be super sneaky. Markdown to PDF will silently switch it back to PDF before requesting the file.

## Running locally

1. `script/bootstrap`
2. `script/server`

## Deploying

1. Click the deploy button above
2. To avoid API rate limits, create a personal access token and expose it as `GITHUB_TOKEN`
