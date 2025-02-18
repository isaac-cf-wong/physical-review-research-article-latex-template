# Physical Review D research article LaTeX template

This repository provides a LaTeX template for writing research articles formatted for *Physical Review D*.

## Features
- Uses `revtex4-2` document class
- Pre-configured for two-column format with APS styling
- Includes an example bibliography (`references.bib`)
- Hyperlinks enabled for references

## Files
- `main.tex`: The main LaTeX file for your article
- `references.bib`: Example BibTeX references
- `Makefile`: Simplifies compilation using `pdflatex` or `latexmk`
- `.gitignore`: Excludes auxiliary files

## Usage
1. Fork this repository to your own GitHub account:
   - Click the "Fork" button at the top-right of this repository page.
2. Create a new repository for your paper production from your fork.
3. Clone your new repository:
   ```sh
   git clone https://github.com/yourusername/your-repository.git
   ```
4. Edit `main.tex` with your article content.
5. Compile the document using:
   ```
   make
   ```
