;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; credit: yorickvP on Github
(setq wl-copy-process nil)
(defun wl-copy (text)
  (setq wl-copy-process (make-process :name "wl-copy"
                                      :buffer nil
                                      :command '("wl-copy" "-f" "-n")
                                      :connection-type 'pipe
                                      :noquery t))
  (process-send-string wl-copy-process text)
  (process-send-eof wl-copy-process))
(defun wl-paste ()
  (if (and wl-copy-process (process-live-p wl-copy-process))
      nil ; should return nil if we're the current paste owner
    (shell-command-to-string "wl-paste -n | tr -d \r")))
(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "MonaspiceNe Nerd Font Mono" :size 20 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "MonaspiceNe Nerd Font Propo" :size 20)
      doom-big-font (font-spec :family "ComicMono NF" :size 20))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/home/Atom/org/")
(after! org
  (setq org-agenda-files
        (list (expand-file-name "inbox.org" org-directory)
              (expand-file-name "note.org" org-directory)
              (expand-file-name "projects.org" org-directory)
              (expand-file-name "schedule.org" org-directory)
              (expand-file-name "tasks.org" org-directory)
              )
        )
  )
;; Latex export
(after! org
  (setq org-latex-default-packages-alist
        (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))
  (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                "xelatex -interaction nonstopmode %f"))
  (setq org-latex-packages-alist
        '(("" "ctex" t)))
  (setq org-latex-hyperref-template
        "\\hypersetup{linktoc=all,colorlinks=true,urlcolor=blue,linkcolor=blue}")
  )
;; last modified
(after! org
  (add-hook 'org-mode-hook
            (lambda ()
              (setq-local time-stamp-active t
                          time-stamp-line-limit 18
                          time-stamp-start "^#\\+last_modified: [ \t]*"
                          time-stamp-end "$"
                          time-stamp-format "\[%Y-%m-%d %a %H:%M:%S\]")
              (add-hook 'before-save-hook 'time-stamp nil 'local))))
(after! org
  (setq org-capture-templates
        '(
          ;; 1. 待办
          ("t" "Task" entry
           (file+headline "~/org/tasks.org" "Todo")
           "* TODO %?\nDEADLINE: %^T\n"
           :empty-lines 1)
          ;; 2. 计划
          ("s" "Schedule" entry
           (file+headline "~/org/schedule.org" "Schedule")
           "* TODO %?\nSCHEDULED: %^T\n"
           :empty-lines 1)
          ;; 3. 灵感
          ("i" "Idea" entry
           (file+headline "~/org/inbox.org" "Inbox")
           "* %?\n%T"
           :empty-lines 1)
          ;; 4. 快速笔记（链接到 Org-roam）
          ("n" "Roam Note" entry
           (file+headline "~/org/note.org" "Quick Notes")
           "* %?\n%i\n%a"
           :empty-lines 1)

          ("l" "Templates for projects")
          ("lt" "Project-local todo" entry  ; {project-root}/todo.org
           (file+headline +org-capture-project-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("ln" "Project-local notes" entry  ; {project-root}/notes.org
           (file+headline +org-capture-project-notes-file "Inbox")
           "* %U %?\n%i\n%a" :prepend t)
          ("lc" "Project-local changelog" entry  ; {project-root}/changelog.org
           (file+headline +org-capture-project-changelog-file "Unreleased")
           "* %U %?\n%i\n%a" :prepend t)

          ("p" "Centralized templates for projects")
          ("pt" "Project todo" entry
           (function +org-capture-central-project-todo-file)
           "* TODO %?\n %i\n %a"
           :heading "Tasks"
           :prepend nil)
          ("pn" "Project notes" entry
           (function +org-capture-central-project-notes-file)
           "* %U %?\n %i\n %a"
           :heading "Notes"
           :prepend t)
          ("pc" "Project changelog" entry
           (function +org-capture-central-project-changelog-file)
           "* %U %?\n %i\n %a"
           :heading "Changelog"
           :prepend t)
          ))
  )

(after! org-roam
  (setq org-roam-directory "/home/Atom/org/roam/")
  (setq org-roam-db-gc-threshold most-positive-fixnum)
  )
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;


(after! evil
  ;; 绑定 J 为向下移动 5 行
  (define-key evil-normal-state-map "J" (lambda () (interactive) (evil-next-line 5)))
  ;; 绑定 K 为向上移动 5 行
  (define-key evil-normal-state-map "K" (lambda () (interactive) (evil-previous-line 5))))
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; chinese inputs
;;(add-hook! 'rime-mode-hook :append
;;    (set-fontset-font t 'han (font-spec :family "Maple Mono SC NF"))
;;    (set-fontset-font t 'cjk-misc (font-spec :family "Maple Mono SC NF"))
;;	)

(use-package! rime
  :custom
  (rime-user-data-dir "~/.config/doom/rime") ;; 可自定义
  (rime-show-candidate 'posframe)
  (rime-posframe-fixed-position t)
                                        ; (rime-disable-predicates ;; 中英文自动转换，可自行增删
                                        ;  '(rime-predicate-prog-in-code-p
                                        ;    rime-predicate-evil-mode-p
                                        ;    rime-predicate-punctuation-after-ascii-p
                                        ;    rime-predicate-punctuation-line-begin-p
                                        ;    rime-predicate-tex-math-or-command-p
                                        ;    rime-predicate-org-latex-mode-p
                                        ;    rime-predicate-org-in-src-block-p
                                        ;    rime-predicate-after-ascii-char-p
                                        ;    rime-predicate-space-after-cc-p
                                        ;    rime-predicate-space-after-ascii-p
                                        ;    rime-predicate-in-code-string-p))
  :config
  (setq default-input-method "rime")
  ;;(map! :nvi "C-`" #'rime-send-keybinding)

                                        ;(add-hook 'prog-mode-hook #'toggle-input-method)
                                        ;(add-hook 'text-mode-hook #'toggle-input-method)
  )

(defun color-banner ()
  (let* ((banner '("███████╗███╗   ███╗ █████╗  ██████╗███████╗"
		   "██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝"
		   "█████╗  ██╔████╔██║███████║██║     ███████╗"
		   "██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║"
		   "███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║"
		   "╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝"
                   ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)
    )
  )

(setq +doom-dashboard-ascii-banner-fn #'color-banner)

(use-package! keycast
                                        ;:config (keycast-mode-line-mode 1)
  :config (keycast-header-line-mode 1)
                                        ;:config (keycast-tab-bar-mode 1)
                                        ;:config (keycast-log-mode 1)
  )

(setq +latex-viewers '(pdf-tools))
;; xelatex
;; (add-hook 'LaTeX-mode-hook
;;           (lambda()
;;             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;;             (setq TeX-command-default "XeLaTeX")
;;             (setq TeX-save-querynil )
;;             (setq TeX-show-compilation t)
;;             ))

(when (display-graphic-p)
  (use-package! xenops
    :hook (latex-mode . xenops-mode)
    :hook (LaTeX-mode . xenops-mode)
    :hook (org-mode . xenops-mode)
    :defer t
    :config
    (map! :map xenops-mode-map
          :n "RET" #'xenops-dwim)
    (setq xenops-cache-directory (concat doom-cache-dir "xenops/")
          xenops-reveal-on-entry t
          xenops-math-latex-process 'dvisvgm
          xenops-math-image-scale-factor 1.5
          )))
