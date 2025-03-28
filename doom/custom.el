;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   '(("Xelatex" "%`xelatex%(mode)% %t --synctex=1" TeX-run-TeX nil t)
     ("TeX"
      "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %(output-dir) %t"
      TeX-run-TeX nil (plain-TeX-mode Texinfo-mode AmSTeX-mode) :help
      "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %T" TeX-run-TeX nil (LaTeX-mode docTeX-mode) :help
      "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %(o-dir) %t" TeX-run-compile nil
      (Texinfo-mode) :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) %(o-dir) --html %t" TeX-run-compile
      nil (Texinfo-mode) :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %(output-dir) %t"
      TeX-run-TeX nil (AmSTeX-mode) :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (ConTeXt-mode) :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (ConTeXt-mode) :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %(O?aux)" TeX-run-BibTeX nil
      (plain-TeX-mode LaTeX-mode docTeX-mode ConTeXt-mode Texinfo-mode
                      AmSTeX-mode)
      :help "Run BibTeX")
     ("Biber" "biber %(output-dir) %s" TeX-run-Biber nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Run Biber")
     ("Texindex" "texindex %s.??" TeX-run-command nil (Texinfo-mode) :help
      "Run Texindex")
     ("Texi2dvi" "%(PDF)texi2dvi %t" TeX-run-command nil (Texinfo-mode) :help
      "Run Texi2dvi or Texi2pdf")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue"
      :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx -o %(O?pdf) %d" TeX-run-dvipdfmx nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f %(O?pdf)" TeX-run-ps2pdf nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Convert PostScript file to PDF")
     ("LaTeXMk"
      "latexmk %(latexmk-out) %(file-line-error) %(output-dir) %`%(extraopts) %S%(mode)%' %t"
      TeX-run-format nil (LaTeX-mode docTeX-mode) :help "Run LaTeXMk")
     ("Glossaries" "makeglossaries %(d-dir) %s" TeX-run-command nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Run makeglossaries to create glossary file")
     ("Index" "makeindex %(O?idx)" TeX-run-index nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Run makeindex to create index file")
     ("upMendex" "upmendex %(O?idx)" TeX-run-index t
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil
      (plain-TeX-mode LaTeX-mode docTeX-mode Texinfo-mode AmSTeX-mode) :help
      "Run xindy to create index file")
     ("Check" "chktex -v6 -H %s" TeX-run-compile nil (LaTeX-mode) :help
      "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil (LaTeX-mode) :help
      "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help
      "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help
      "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help
      "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))
 '(org-agenda-files
   '("~/Org/roam/20250324131258-ca_pipelining.org" "/home/Atom/Org/notes.org"
     "/home/Atom/Org/todo.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
