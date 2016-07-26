
;; custom themes

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'badwolf t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; setting window size

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 120))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 200)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

; pairing the parenthesis and other stuff
(electric-pair-mode +1)

; line numbering 

(load-file "~/.emacs.d/elisp/setnu.el")

(add-hook 'text-mode-hook 'turn-on-setnu-mode)
(add-hook 'python-mode-hook 'turn-on-setnu-mode)
(add-hook 'c-mode-hook 'turn-on-setnu-mode)
(add-hook 'js-mode-hook 'turn-on-setnu-mode)
(add-hook 'html-mode-hook 'turn-on-setnu-mode)
(add-hook 'css-mode-hook 'turn-on-setnu-mode)

;; replace selected text
(delete-selection-mode 1)
(put 'upcase-region 'disabled nil)

;; to the line end with cmd+right
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<right>") 'move-end-of-line)

;; to the line start with cmd+left
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; to the doc end with cmd+right
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

;; to the doc start with cmd+left
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)

;; default indent
 (setq-default c-basic-offset 4)

;; turn on blink matching
(show-paren-mode 2)
