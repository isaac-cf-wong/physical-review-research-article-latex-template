# Figures Directory

This directory is intended to store all figures used in the PRD article.

## Guidelines
- Store all figures in this directory to keep the repository organized.
- Use vector formats (`.pdf`, `.svg`) for plots when possible to ensure high quality.
- For raster images (`.png`, `.jpg`), use high resolution to avoid pixelation in the final PDF.
- Reference figures in `main.tex` using:
  ```latex
  \begin{figure}
      \centering
      \includegraphics[width=0.8\linewidth]{example.pdf}
      \caption{An example figure.}
      \label{fig:example}
  \end{figure}
  ```
