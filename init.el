;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;; emacs basic setting only for version 23 and later version         ;; put this file (init.el) in ~/.emacs.d/                            ;; NOTE: ~/.emacs.d/init.el equals to ~/.emacs                       ;; You are advised to use emacs 24.3+                                ;; More detail information refers to README.md                       ;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++(add-to-list 'load-path "~/.emacs.d/site-lisp/")(let ((default-directory "~/.emacs.d/site-lisp/"))  (normal-top-level-add-subdirs-to-load-path))(add-to-list 'load-path "~/.emacs.d/site-lisp/wubi")(add-to-list 'load-path "~/.emacs.d/keys-setting/")(add-to-list 'load-path "~/.emacs.d/site-lisp/old-emacs-package/")(add-to-list 'load-path "~/.emacs.d/local/")(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0/")(add-to-list 'load-path "~/.emacs.d/modules/")(add-to-list 'load-path "~/.emacs.d/utils/")(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex-11.87");; --------------------------------------------------------------------;; setting exec-path, which like terminal's PATH variable;; --------------------------------------------------------------------(add-to-list 'exec-path "/usr/local/racket/bin");; --------------------------------------------------------------------;; add require features defined by myself;; --------------------------------------------------------------------(require 'shell-dealing)(require 'copy-line)(require 'move-swift)(require 'emacs-nifty-tricks)(require 'insert-string)(require 'buffer-dealing)(require 'window-dealing)(require 'quick-file-jump)(require 'ab-help)(require 'latex-dealing)(require 'run-scripts)(require 'basic-key-binding)           ;; global basic key binding;; --------------------------------------------------------------------;; emacs package manager;; Emacs is not a package manager, and here we load its package manager!;; --------------------------------------------------------------------(require 'package)(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")                  ("elpa" . "http://tromey.com/elpa/")                  ;; TODO: Maybe, use this after emacs24 is released                  ;; (development versions of packages)                  ("melpa" . "http://melpa.milkbox.net/packages/")                  ))  (add-to-list 'package-archives source t))(package-initialize);; --------------------------------------------------------------------;; set indent;; --------------------------------------------------------------------(setq-default indent-tabs-mode nil)(setq indent-tabs-mode nil)(setq default-tab-width 4)(setq tab-width 4);;(setq max-lisp-eval-depth 3000)      ;; default 500;;(setq max-specpdl-size 3000)         ;; default 1000;; --------------------------------------------------------------------;;; add follwing code to keep *shell* in middle using;;    C-l C-l;; --------------------------------------------------------------------;(remove-hook 'comint-output-filter-functions 			 'comint-postoutput-scroll-to-bottom);; --------------------------------------------------------------------;;; custom-set-variables, which are produced by system.;; --------------------------------------------------------------------;(custom-set-variables ;; custom-set-variables was added by Custom. ;; If you edit it by hand, you could mess it up, so be careful. ;; Your init file should contain only one such instance. ;; If there is more than one, they won't work right. '(ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("*shell*") ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*" . t) ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*")))) '(ecb-layout-name "left8") '(ecb-layout-window-sizes (quote (("left8" (0.8 . 1.0))))) '(ecb-non-semantic-exclude-modes (quote (scheme-mode fundamental-mode text-mode))) '(ecb-options-version "2.40") '(ecb-prescan-directories-for-emptyness t) '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1)) '(ecb-sources-menu-user-extension-function (quote ignore)) '(ecb-tip-of-the-day nil) '(ecb-windows-width 0.175) '(session-use-package t nil (session)) '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64))))(put 'erase-buffer 'disabled nil);; --------------------------------------------------------------------;; basic setting for emacs and mode turn on or off when boot up;; --------------------------------------------------------------------;; max frame when launch emacs GUI(setq inhibit-startup-message t)(require 'hl-line)                  ; highlight current line(global-hl-line-mode t)             ; setting as global hl(setq x-select-enable-clipboard t)  ; copy and paste with other program(show-paren-mode t)                 ; paren match show(column-number-mode t)              ; show column number(global-auto-revert-mode t) (global-linum-mode t)               ; show line number(setq linum-format "%4d \u2502")    ; for GUI and command line emacs 24;; (setq linum-format "%4d |")      ; for command line emacs 23(setq frame-title-format '("%b (%f) &aborn love cld&  [%s] emacs" emacs-version))   (require 'uniquify)(setq uniquify-buffer-name-style 'reverse);; (add-hook 'text-mode-hook 'turn-on-auto-fill);; (add-hook 'text-mode-hook 'flyspell-mode);; (flyspell-prog-mode)                ; flyspell mode for comments & strings only;; (kill-buffer "*scratch*")(find-file "~/.emacs.d/init.el")    ; initial open init.el file (unless (get-buffer "*shell*")  (shell))                          ; open shell when boot up ;; --------------------------------------------------------------------;;  mode line setting;; --------------------------------------------------------------------(display-time)(setq display-time-24hr-format t)(setq display-time-use-mail-icon t)(setq display-time-day-and-date t);; --------------------------------------------------------------------;; setting org-mode;; --------------------------------------------------------------------;; (setq org-todo-keywords;; '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))(setq org-todo-keywords	  '((sequence "TODO" "ONGOING" "DONE" "DELEGATED")))(setq org-log-done 'time)   ;;  setting close time(setq org-log-done 'note)   ;;  setting a log note;; (set org-modules 'habits);; --------------------------------------------------------------------;; By an unknown contributor, move-cursor to matched bracket;; The hot-key binding to %;; --------------------------------------------------------------------(global-set-key "%" 'match-paren)(defun match-paren (arg)				  "Go to the matching paren if on a paren; otherwise insert %."  (interactive "p")  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))        (t (self-insert-command (or arg 1)))));; --------------------------------------------------------------------;; from http://nongnu.askapache.com//color-theme/color-theme-6.6.0.zip;; then unzip this file into ~/.emacs.d/site-lisp/;; --------------------------------------------------------------------(require 'color-theme)(color-theme-initialize)(setq color-theme-is-global t)			(if (file-exists-p "~/.emacs.d/local/local-setting.el")	(message "use local-setting.el configure")       ;; using the local setting  (color-theme-robin-hood)  ;; (eval-after-load "color-theme" 	;; (if window-system  	;; 	'(color-theme-subtle-hacker)  ;; GUI mode	;;   '(color-theme-tty-dark)))       ;; Command line mode  )(color-theme-tty-dark);; setting color-theme as dream-theme mode(require 'dream-theme)(setq highlight-tail-colors '(("black" . 0)							  ("#bc2525" . 25)							  ("black" . 66)));;(color-theme-dark-green)          ;; other options;;(color-theme-billw)               ;; other options;;(Color-theme-subtle-hacker)       ;; this for GUI, or color-theme-select;;(color-theme-tty-dark)            ;; this for command line mode;; --------------------------------------------------------------------;; column-marker.el and fill-column-indicator.el setting;; hot key: C-x m      unset C-u C-x m;; --------------------------------------------------------------------(require 'column-marker)(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))    (global-set-key [?\C-x ?m] 'column-marker-3)(require 'fill-column-indicator)  (setq fci-rule-width 2)  (setq fci-rule-color "yellow")  (setq fci-rule-column 80)  (define-globalized-minor-mode     global-fci-mode fci-mode (lambda () (fci-mode 1)))  (global-fci-mode 1)  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; emace auto-complete version 1.3.1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")(require 'auto-complete-config)(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")(setq ac-comphist-file (expand-file-name                        "~/.emacs.d/ac-comphist.dat"))(ac-config-default);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; set c/c++ mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(setq c-default-style "linux"      c-basic-offset 4      tab-width 4      indent-tabs-mode t)(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)));;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; set markdown-mode download from ;;                    http://jblevins.org/projects/markdown-mode/;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(load-file "~/.emacs.d/modules/markdown-mode.el")(autoload 'markdown-mode "markdown-mode"  "Major mode for editing Markdown files" t)(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode));;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; install cedet and add speedbar download from ;;     http://www.emacswiki.org/emacs/sr-speedbar.el;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(global-ede-mode 1)(require 'semantic/analyze)(require 'semantic/sb)(semantic-mode 1)(provide 'semantic-analyze)(provide 'semantic-ctxt)(provide 'semanticdb)(provide 'semanticdb-find)(provide 'semanticdb-mode)(provide 'semantic-load);; Semantic(global-semantic-idle-completions-mode -1)(global-semantic-show-unmatched-syntax-mode nil);;(global-semantic-idle-completions-mode t)(global-semantic-decoration-mode t)(global-semantic-highlight-func-mode t)(global-semantic-show-unmatched-syntax-mode t);; CC-mode(add-hook 'c-mode-hook '(lambda ()                          (setq ac-sources (append '(ac-source-semantic) ac-sources))                          (local-set-key (kbd "RET") 'newline-and-indent)                          (linum-mode t)                          (semantic-mode t)));;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; setting speedbar;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(require 'sr-speedbar)(global-set-key (kbd "C-x C-y") 'sr-speedbar-toggle)(setq sr-speedbar-right-side nil)  ;; nil means speedbar appears on left(setq sr-speedbar-skip-other-window-p t)(setq speedbar-show-unknown-files t);;(setq sr-speedbar-max-width 10);;(setq sr-speedbar-width-x 20);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; add undo-tree download from, C-x u to shows undo-tree graph;;                         http://www.dr-qubit.org/undo-tree/undo-tree.el ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(require 'undo-tree)(global-undo-tree-mode t);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; add matlab mode, this setting from ;;              http://www.emacswiki.org/emacs/MatlabMod;; code download from http://download.csdn.net/detail/loveaborn/6814809;; or http://matlab-emacs.cvs.sourceforge.net/viewvc/matlab-emacs/;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(add-to-list 'load-path "~/.emacs.d/site-lisp/matlab-emacs")    ; matlab.el path(add-to-list 'load-path "/usr/matlab/bin/matlab")               ; matlab path(require 'matlab-load)(require 'matlab)(require 'cedet-matlab)(autoload 'run-octave "octave-inf" nil t)                       ; special(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)(setq matlab-indent-function-body t)    ; if you want function bodies indented(setq matlab-verify-on-save-flag nil)   ; turn off auto-verify on save(defun my-matlab-mode-hook ()  (setq fill-column 80))		        ; where auto-fill should wrap(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)(defun my-matlab-shell-mode-hook ()  '())(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)(global-font-lock-mode t)                                        ;  To get hilit19 support try adding:(require 'tlc)(autoload 'tlc-mode "tlc" "tlc Editing Mode" t)(add-to-list 'auto-mode-alist '("\\.tlc$" . tlc-mode))(setq tlc-indent-function t);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; add php-mode download from;;    http://www.emacswiki.org/emacs/download/php-mode-improved.el;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(require 'php-mode)(autoload 'php-mode "php-mode" "Major mode for editing php code." t)(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode));;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; add web-mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(require 'web-mode)(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode));;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  add session.el and desptop setting;;  download from http://emacs-session.sourceforge.net/;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;(require 'session)(add-hook 'after-init-hook 'session-initialize)(require 'desktop)(desktop-save-mode 1)(defun my-desktop-save ()  (interactive)  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.  (if (eq (desktop-owner) (emacs-pid))	  (desktop-save desktop-dirname)))(add-hook 'auto-save-hook 'my-desktop-save);;------------------------------------------------------------------------------;; add chinese wubi input method to emacs;; url:daiyuwen.freeshell.org/gb/wubi/wubi.html ;;------------------------------------------------------------------------------(require 'wubi)(wubi-load-local-phrases) ;add user's wubi phrases(register-input-method "chinese-wubi" "Chinese-GB" 'quail-use-package                       "WuBi" "WuBi"                       "wubi") (setq default-input-method "chinese-wubi");; (global-set-key "\C-c\C-j" 'toggle-input-method)  ;; other except .md;; (global-set-key "\C-cj" 'toggle-input-method)     ;; .md(global-set-key [?\S- ] 'toggle-input-method)     ;; .md and other;;------------------------------------------------------------------------------;; add sql-indent mode;; wget http://www.emacswiki.org/emacs/sql-indent.el;;------------------------------------------------------------------------------(eval-after-load "sql"  (load-library "sql-indent"));;------------------------------------------------------------------------------;; add ace-jump mode for quick jump http://www.emacswiki.org/emacs/AceJump;; download from ;;     https://github.com/winterTTr/ace-jump-mode/blob/master/ace-jump-mode.el;;------------------------------------------------------------------------------(require 'ace-jump-mode);;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode);;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode)(global-set-key (kbd "C-c SPC") 'ace-jump-mode)(global-set-key (kbd "C-x SPC") 'ace-jump-mode)(global-set-key (kbd "M-z") 'ace-jump-mode)(define-key global-map (kbd "C-x n") 'ace-jump-line-mode);; If you also use viper mode:;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode);;------------------------------------------------------------------------------;; add quick-jump mode ;; download from http://www.emacswiki.org/emacs/quick-jump.el;;------------------------------------------------------------------------------(require 'quick-jump);; (quick-jump-default-keybinding)(global-set-key (kbd "C-<") 'quick-jump-go-back)(global-set-key (kbd "C->") 'quick-jump-go-forward)(global-set-key (kbd "C-x C-x") 'quick-jump-push-marker)(global-set-key (kbd "C-c C-c") 'quick-jump-clear-all-marker);;------------------------------------------------------------------------------;; highlight-tail, which is download from ;;     http://blog.arithm.com/2008/04/12/highlight-tail-for-emacs/;; and the chinese reference is;;     http://emacser.com/highlight-tail.htm;; the file is highlight-tail.el;; donot use highlight-tail in mac system;;------------------------------------------------------------------------------;; (require 'highlight-tail);; (message "Highlight-tail loaded - now your Emacs will be even more sexy!");;  here some setq of variables - see CONFIGURATION section below ;; (setq highlight-tail-colors '(("black" . 0);;							  ("#bc2525" . 25);;							  ("black" . 66)));; (setq highlight-tail-steps 14;;	  highlight-tail-timer 1);; (setq highlight-tail-posterior-type 'const);; (if (not highlight-tail-mode) ;;	(highlight-tail-mode 1)   ;; open tail mode if it does not open;;  (message "highlight-mode-mode already opened."))             ;;------------------------------------------------------------------------------;; change to dream-theme, this theme file in modules/dream-theme.el;; download from https://github.com/djcb/dream-theme;;------------------------------------------------------------------------------;; (require 'dream-theme);;------------------------------------------------------------------------------;; add maxframe package.;; https://github.com/rmm5t/maxframe.el;;   in mac system, do not use to max the current frame;;------------------------------------------------------------------------------;; (require 'maxframe);; (add-hook 'window-setup-hook 'maximize-frame t);;------------------------------------------------------------------------------;; personal information these variables may be used in ;; ~/.emacs.d/utils/insert-string.el;;------------------------------------------------------------------------------(setq user-full-name "Aborn Jiang"      user-mail-address "aborn.jiang@foxmail.com")(setq chinese-name "Guobao Jiang")             ;(setq shell-name "eshell")        ;; default for shell;;(setq shell-name "shell")      ;; default value;;------------------------------------------------------------------------------;; Add MIT/GNU scheme xscheme.el, which download from;; http://ftp.gnu.org/gnu/mit-scheme/utilities.pkg/xscheme.el;;------------------------------------------------------------------------------(require 'xscheme);;------------------------------------------------------------------------------;; Add buffer-move.el download from;; http://www.emacswiki.org/cgi-bin/wiki/buffer-move.el;;------------------------------------------------------------------------------(require 'buffer-move);;------------------------------------------------------------------------------;; add gnus, download using following command.;; supported on begin emacs 24.4;;      git clone http://git.gnus.org/gnus.git;; in ~/.emacs.d/gnus;; add eww Emacs Web Wowser, download from ;; http://bzr.savannah.gnu.org/lh/emacs/trunk/annotate/head:/lisp/net/eww.el;;------------------------------------------------------------------------------;; (setq load-path (cons (expand-file-name "~/.emacs.d/gnus/lisp/") load-path));; (when (file-directory-p "~/.emacs.d/gnus");;   (require 'gnus-load);;   (require 'info);;   (if (featurep 'xemacs);; 	  (add-to-list 'Info-directory-list "~/.emacs.d/gnus/texi/");; 	(add-to-list 'Info-default-directory-list "~/.emacs.d/gnus/texi/"));;   );; -----------------------------------------------------------------------------;; add quack for racket-lang, which download from ;;   http://www.neilvandyke.org/quack/;; add geiser , download from ;;      http://www.nongnu.org/geiser/ using git clone;;      git clone http://git.sv.gnu.org/r/geiser.git;; -----------------------------------------------------------------------------(require 'package)(add-to-list 'package-archives             '("marmalade" . "http://marmalade-repo.org/packages/"))(package-initialize)(load "~/.emacs.d/site-lisp/geiser/elisp/geiser-load");;(require 'geiser-load)(require 'quack)(add-hook 'geiser-repl-mode-hook          (lambda ()            (local-set-key (kbd "C-j") 'switch-to-buffer)             ));; -----------------------------------------------------------------------------;; shell completion mode, which download;; http://www.emacswiki.org/emacs/download/shell-completion.el;; and http://www.namazu.org/~tsuchiya/elisp/shell-command.el;; and https://github.com/szermatt/emacs-bash-completion;; and https://github.com/mooz/emacs-zlc/     (for zsh);; -----------------------------------------------------------------------------;; (require 'shell-completion);; (require 'shell-command);; (shell-command-completion-mode);; (require 'bash-completion);; (bash-completion-setup);; (require 'zlc);; (zlc-mode t);; -----------------------------------------------------------------------------;; key binding, all files are in ~/.emacs.d/keys-setting;; -----------------------------------------------------------------------------(require 'global-key-binding)            ; global key binding(require 'major-mode-binding)            ; local major mode key binding;; -----------------------------------------------------------------------------;;Remove/kill completion buffer when done-----;;could use ido-find-file instead, since it never uses *Completions*;;Note that ido-mode affects both buffer switch, &  find file.;; -----------------------------------------------------------------------------(add-hook 'minibuffer-exit-hook          '(lambda ()             (let ((buffer "*Completions*"))               (and (get-buffer buffer)                    (kill-buffer buffer)))             ));; -----------------------------------------------------------------------------;; eshell settings;; this setting must be put before eshell startup;; -----------------------------------------------------------------------------(setq eshell-save-history-on-exit t)(load-file "~/.emacs.d/utils/eshell-utils.el")(add-hook 'eshell-mode-hook          (lambda ()            (local-set-key (kbd "C-j") 'switch-to-buffer)            (local-set-key (kbd "C-a") 'eshell-bol)            (local-set-key (kbd "C-c SPC") 'ace-jump-mode)            (local-set-key (kbd "M-p") 'eshell-previous-matching-input-from-input)            (local-set-key (kbd "M-n") 'eshell-next-matching-input-from-input)            (local-set-key (kbd "C-M-n") 'set-mark-command)            (local-set-key (kbd "<up>") 'eshell-previous-matching-input-from-input)            (local-set-key (kbd "C-x C-j") 'eshell/clear)            (local-set-key (kbd "M-r") 'eshell-isearch-backward)            (local-set-key (kbd "<down>") 'eshell-next-matching-input-from-input)));; -----------------------------------------------------------------------------;; edit-server.el  for chrome edit with emacs, this ;; is a chrome extension ;; -----------------------------------------------------------------------------(when (locate-library "edit-server")  (require 'edit-server)  (setq edit-server-new-frame nil)  (edit-server-start));; -----------------------------------------------------------------------------;; cursor change automatically based the file mode;; http://www.emacswiki.org/emacs-en/ChangingCursorDynamically;; only can be used when you are not use OneOneOneEmacs;; -----------------------------------------------------------------------------(require 'cursor-chg)  ; Load the library(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode;; -----------------------------------------------------------------------------;; some configure from Sacha Chua;; http://pages.sachachua.com/.emacs.d/Sacha.html;; -----------------------------------------------------------------------------;; for backups files (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))(setq delete-old-versions -1)(setq version-control t)(setq vc-make-backup-files t)(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list" t)));; lazy people uses y instead of yes(fset 'yes-or-no-p 'y-or-n-p);; Smartscan(require 'smartscan)(global-smartscan-mode t)(define-key smartscan-map (kbd "M-o") 'smartscan-symbol-go-forward)(define-key smartscan-map (kbd "M-l") 'smartscan-symbol-go-backward);; Searching based on the current word(load-file "~/.emacs.d/utils/sacha-search.el")(global-set-key '[C-up] 'sacha/search-word-backward)(global-set-key '[C-down] 'sacha/search-word-forward);; !!NOTE: smartscan and sacha/search take similar actions.;; -----------------------------------------------------------------------------;; automatic and manual symbol highlighting for Emacs;; link: https://github.com/nschum/highlight-symbol.el;; -----------------------------------------------------------------------------(require 'highlight-symbol)(global-set-key (kbd "<C-return>") 'highlight-symbol-at-point)(global-set-key (kbd "C-x C-SPC") 'highlight-symbol-mode);; (global-set-key (kbd "C-x RET") 'highlight-symbol-at-point);; (global-set-key [f3] 'highlight-symbol-next);; (global-set-key [(shift f3)] 'highlight-symbol-prev);; (global-set-key [(meta f3)] 'highlight-symbol-query-replace);; -----------------------------------------------------------------------------;; setting font for mac system;; -----------------------------------------------------------------------------;; Setting English Font (set-face-attribute 'default nil :font "Monaco 14");; Chinese Font 配制中文字体(dolist (charset '(kana han symbol cjk-misc bopomofo))  (set-fontset-font (frame-parameter nil 'font)                    charset                    (font-spec :family "Kaiti SC" :size 15)));; Note: you can chang "Kaiti SC" to "Microsoft YaHei" or other fonts;; -----------------------------------------------------------------------------;; set multi-term;; -----------------------------------------------------------------------------(require 'multi-term)(setq multi-term-program "/bin/zsh")(add-to-list 'term-bind-key-alist '("C-j"))(add-to-list 'term-bind-key-alist '("C-o"))(add-to-list 'term-bind-key-alist '("C-a"))(add-to-list 'term-bind-key-alist '("C-e"))(add-to-list 'term-bind-key-alist '("C-f"))(add-to-list 'term-bind-key-alist '("C-b"));; Use Emacs terminfo, not system terminfo, mac系统出现了4m(setq system-uses-terminfo nil);; 下面设置multi-term buffer的长度无限(add-hook 'term-mode-hook          (lambda ()            (setq term-buffer-maximum-size 0)))(add-hook 'term-mode-hook          (lambda ()            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))			(add-to-list 'term-bind-key-alist '("C-d" . delete-char))            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))));; # If you use Cocoa Emacs or Carbon Emacs if necessary;; tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti;; -----------------------------------------------------------------------------;; start some modules when bootup.;; -----------------------------------------------------------------------------(eshell)                         ; open eshell at boot(ielm)(ab/shell "2shell")              ; open another shell;; --------------------------------------------------------------------;; js2-mode for javascript;; --------------------------------------------------------------------;;(add-to-list 'load-path "~/.emacs.d/site-lisp/js2-mode");;(require 'js2-mode)(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))(add-hook 'js-mode-hook 'js2-minor-mode)(add-hook 'js2-mode-hook 'ac-js2-mode)(add-to-list 'interpreter-mode-alist '("node" . js2-mode))(require 'flymake-jslint)(add-hook 'js-mode-hook 'flymake-jslint-load);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; last modified by Aborn Jiang (aborn.jiang@foxmail.com) at 2015-06-30;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;