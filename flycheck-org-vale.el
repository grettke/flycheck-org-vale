;;; flycheck-org-vale.el --- An Org syntax checker using Vale  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Wisdom and Wonder

;; Author: Grant Rettke <grant@wisdomandwonder.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1") (flycheck "33"))
;; Keywords: convenience, languages, tools
;; Homepage: https://github.com/org2blog/org2blog
;; https://github.com/grettke/flycheck-org-vale

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; FlycheckOrgVale:
;;
;; A Laser-Focused Zero-Configuration Single-File Vale Org Syntax Checker.

;;; Code:

(require 'flycheck)

(defun flycheck-org-vale--template-file ()
  "Gets the fully-qualified path of the Vale template.

Finds the source file containing
`flycheck-define-checker--get-template'. Otherwise
`error' notify the user.

This must succeed in order for the package to work.

Note usage of `file-exists-p' instead of `file-readable-p'.

Only the Vale subprocess needs to be able to read the
template file: not Emacs. Although Vale is run as a subprocess
of Emacs: that doesn't ensure that actual `vale' command cannot
read the file. For example `vale' can `sudo' to run
with elevated priviledges making the file readable.

By that logic though should Emacs even check if the file exists
at all? Probably yes because the concept of checking for the
existence of a file requiring less prviledges than the ability
to read it exists and could happen here. That said the
likelihood of this combation (and surely there are many more)
might be low but it is worth checking here to make the user
experience better.

It might feel like an inordinate amount of detail has gone
into this explanation but it is important to justify the choice
made here."
  (catch 'return
    (condition-case-unless-debug err
        (let* ((errfmt
                (format "[FLYCHECK-ORG-VALE ERROR]: %s"
                        (concat
                         "I’m sorry but %s. "
                         "Please visit URL "
                         "`https://github.com/grettke/flycheck-org-vale' "
                         "for assistance. Please include these details: %s.")))
               (fn-name 'flycheck-org-vale--template-file)
               (match (find-function-noselect fn-name)))
          (unless (and (consp match) (cdr match))
            (error errfmt
                   (format "there is no source found for function `%s'" fn-name)
                   err)
            (throw 'return nil))
          (let* ((lisp-buf (car match))
                 (lisp-file (with-current-buffer lisp-buf (buffer-file-name)))
                 (file-dir (file-name-directory lisp-file))
                 (tmpl-filename "flycheck-org-vale.tmpl")
                 (tmpl-full-filename (format "%s%s" file-dir tmpl-filename)))
            (unless (file-exists-p tmpl-full-filename)
              (error errfmt
                     (format "source file `%s' does not exist" tmpl-full-filename)
                     err)
              (throw 'return nil))
            (let ((result tmpl-full-filename))
              result)))
      (error err
             "I ran into an error that I don't know how to handle"
             err)
      (throw 'return nil))))

(flycheck-define-checker org-vale
  "An Org syntax checker using VALE.

Uses Vale. See URL `https://vale.sh/'.

It only checks a single file at a time:
the file backing the current buffer."
  :modes org-mode
  :predicate (lambda () (flycheck-buffer-saved-p))
  :standard-input nil
  :command ("vale"
            "--output"
            (eval (flycheck-org-vale--template-file))
            source)
  :error-patterns
  ((error line-start
          line ":" column ":error:" (message) ":" (id (one-or-more (not (any ":"))))
          line-end)
   (warning line-start
            line ":" column ":warning:" (message) ":" (id (one-or-more (not (any ":"))))
            line-end)
   (info line-start
         line ":" column ":suggestion:" (message) ":" (id (one-or-more (not (any ":"))))
         line-end)))

(add-to-list 'flycheck-checkers 'org-vale 'append)

(provide 'flycheck-org-vale)
;;; flycheck-org-vale.el ends here

