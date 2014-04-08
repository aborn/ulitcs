(provide 'local-setting)

;; setting color-theme
(require 'dream-theme)
(setq highlight-tail-colors '(("black" . 0)
							  ("#bc2525" . 25)
							  ("black" . 66)))

;;setting frame/window
(require 'frame-cmds)
(maximize-frame)
;; (delete-other-windows)             ; keep one window
(sr-speedbar-toggle)
(other-window 1)
(split-window-horizontally)      ; keep horizontally two windows
