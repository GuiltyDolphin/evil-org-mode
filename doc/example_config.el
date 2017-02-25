(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)
(require 'leader)
(require 'hydra)

(add-hook 'org-mode-hook
          (lambda ()
            ;; Set key theme(s)
            (evil-org-set-key-theme '(additional textobjects))

            ;; Custom mappings
            (evil-define-key 'normal evil-org-mode-map
              (kbd "-") 'org-ctrl-c-minus
              (kbd "|" 'org-table-goto-column))

            ;; Configure leader key
            (evil-leader/set-key-for-mode 'org-mode
              "t" 'org-todo
              "T" 'org-show-todo-tree
              "a" 'org-agenda
              "c" 'org-archive-subtree
              "l" 'evil-org-open-links
              "o" 'evil-org-recompute-clocks)

            ;; Define a hydra
            (defhydra hydra-org-state ()
              ("h" org-up-element)
              ("l" org-down-element)
              ("j" org-forward-element)
              ("k" org-backward-element)
              ("H" org-shiftleft)
              ("L" org-shiftright)
              ("K" org-shiftup)
              ("J" org-shiftdown)
              ("." org-ctrl-c-ctrl-c)
              ("i" org-cycle))))
