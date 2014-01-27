(add-to-list 'load-path (expand-file-name "~/.emacs.d/better-defaults"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/evil-surround"))

(require 'better-defaults)
(require 'package)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'evil)
(require 'surround)
(require 'color-theme)

(evil-mode 1)
(global-surround-mode 1)

(load-theme 'base16-eighties)

;; Lift the exec path from the user shell
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
  This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)
