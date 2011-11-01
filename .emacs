(setq display-time-day-and-date t)
(setq display-time-24hr-format)
(display-time)

;;;禁止ecb启动提示
(setq ecb-tip-of-the-day nil)
;;支持ecb里使用鼠标
'(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
;;Semantic-settings
'(semantic-default-c-setup)

(defun arrange-frame (w h x y)
  "Set the widht, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)
    )
  )

(arrange-frame 80 80 500 0)
;;;加载cscope
(require 'xcscope)

;;mail
;;(autoload 'server-edit "server" nil t)
;;(server-edit)

;;设置行宽
(setq default-fill-column 80)

;;(setq tags-file-name "/home/vinian/TAGS")
;;(global-set-key [(control tab)]'ac-complete)

(setq time-stamp-start "最后更新时间:[   ]+\\\\?")
(setq time-stamp-end: "\n")
(setq time-stamp-format: "%:y年%:m月%:d日")

;为什么总是问yes或是no
(fset 'yes-or-no-p' y-or-n-p)


;显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;高亮显示拷贝区域
(transient-mark-mode t)

;交互式粘贴
(setq x-select-enable-clipboard t)

;语法高亮
(global-font-lock-mode 1)

;自动显示图片
(auto-image-file-mode)

;光标靠近指针时，指针自动让开
(mouse-avoidance-mode 'animate)

;显示匹配的括号
(show-paren-mode t)

;去掉工具条
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(define-key ac-mode-map (kbd "C-TAB") 'auto-complete)

;;gccsense
;;(require 'gccsense)

;;中文环境中使用ispell
(setq-default ispell-program-name "aspell")
(setq-default ispell-local-dictionary "american")
(global-set-key (kbd "") 'ispell-complete-word)

(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(read-abbrev-file "~/.emacs.d/msf-abbrev.el")
(setq save-abbrevs t)

;;输入密码时不明文显示
(add-hook 'comint-output-filter-functions
		  'comint-watch-for-password-prompt)

;;欧洲时间显示 天/月/年(DD/MM/YYYY)
(setq european-calendar-style 't)

;;显示今天的安排
(diary)

;;;test
;;(require 'goto-percent)
;;;;tet
;显示行号
(set-scroll-bar-mode nil); no scroll bar, even in x-window-system
(require 'wb-line-number)
(wb-line-number-toggle)
(wb-line-number-enable)

;当文件名以相应的字符结尾时自动打开相应模式
(setq auto-mode-alist
        (append ' (("\\.cpp$" . c++-mode)
 	    ("\\.hpp$" . c++-mode)
	    ("\\.plx?$" . cperl-mode)
	    ("\\.[sS]$" . asm-mode)
	    ("\\.lsp$" . lisp-mode)
	    ("\\.php$" . php-mode)
		("\\.txt$" . text-mode)
		("\\[^\.$]" . text-mode)
	    ) auto-mode-alist))

;启动frame窗口大小设置
;(setq default-frame-alist
;'((height . 80)(width . 75)(top . -1)(left . -1)(menu-bar-lines . 20)(tool-bar-lines . 0)))

;font-configure
(set-default-font "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(set-background-color "DarkSeaGreen2")
;;(color-theme-lawernce)
;;(color-theme-darkseagreen2)
;;(color-theme-snowish)
;;(color-theme-subtelhacker)
;;(color-theme-while on grey)
;;(color-theme-taming mr arneson)
;;(color-theme-comidia)
;;;外观
;;(setq frame-title-format "veinian@gmail.com")

;;'(browse-url-mozilla-program "firefox")

;;(define-key c-mode-base-map [(meta ?/)]'semantic-ia-complete-symbol-menu)

;;(setq semanticdb-project-roots
;;(list
;;(expand-file-name "/")));
;;(global-set-key [(control tab)]'senator-complete-symbol)
;;(global-set-key [(control tab)]'senator-completion-menu-popup)
;;(global-set-key [(control tab)]'semantic-ia-complete-symobl-menu)

;;; emms configure
;; (require 'emms-source-file)
;; (require 'emms-source-playlist)
;; (require 'emms-player-simple)
;; (require 'emms-player-mplayer)
;; (require 'emms-playlist-mode)
;; (require 'emms-info)
;; (require 'emms-cache)
;; (require 'emms-mode-line)
;; (require 'emms-playing-time)
;; (require 'emms-score)
;; (require 'emms-volume)

;; (setq emms-playlist-default-major-mode 'emms-playlist-mode)
;; (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
;; (add-to-list 'emms-info-functions 'kid-emms-info-simple)
;; (setq emms-track-description-function 'kid-emms-info-track-description)
;; (when (fboundp 'emms-cache)
;;   (emms-cache 1))

;; (setq emms-player-list
;;       '(emms-player-mplayer
;;         emms-player-ogg123
;;      	emms-player-mpg321))

;; (setq emms-info-asynchronously nil)
;; (setq emms-playlist-buffer-name "*Music*")
;; ;; use faster finding facility if you have GNU find
;; (setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

;; ;;; My musics
;; (setq emms-source-file-default-directory "~/Music")

;; (add-hook 'emms-player-started-hook 'emms-show)

;; ;; mode line format
;; (setq emms-mode-line-format "[ %s "
;;       emms-playing-time-display-format "%s ]")
;; (setq global-mode-string
;;       '("" emms-mode-line-string " " emms-playing-time-string))

;;(set-foreground-color "green")
;;(set-background-color "darkslategray")

;;;common 
(setq visible-bell nil);禁止响铃
;;;启动界面
(setq inhibit-splash-screen t);关闭splash-screen
(setq inhibit-startup-message t);关闭startup-screen
;;(setq-default cursor-type 'bar);光标显示为一竖线

;;;打开pdf默认用acroread
;;(add-hook 'LaTeX-mode-hook
;;(lambda ()
;;(setq TeX-output-view-style (cons '("^pdf$" "." "acroread %o") TeX-output-view-style))
;;))

;tab
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40
      44 48 52 56 60 64 68 72 76 80 84 88 92 96))

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
;  (c-toggle-auto-hungry-state 1)
  ;; key bindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook) 



;function
(defun my-insert-date()
 (interactive)
 (insert (user-full-name))
 (insert "@")
 (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
(global-set-key (kbd "C-c m d") 'my-insert-date)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(truncate-partial-width-windows nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;(add-to-list 'load-path "~/.emacs.d")
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;;(require 'auto-complete-config)
;;(ac-config-default)

;; Load CEDET
;;;(load-file "/home/vinian/.emacs.d/cedet-1.0/common/cedet.el")
;; Enable EDE (Project Management) features
;;(global-ede-mode 1)

;;(add-to-list 'load-path
;; 	"/home/vinian/.emacs.d/ecb-2.40")
;;(load-file "/home/vinian/.emacs.d/ecb-2.40/ecb.el")
;;(require 'ecb)
;;(require 'ecb-autoloads)

(defun count-words-buff ()
  "Count the number of words in the current-buffer;
print a message in the minibuffer with the result."
  (interactive)
  (let ((count 0))
	(save-excursion
	  (goto-char (point-min))
	  (while (< (point) (point-max))
		(forward-word 1)
		(setq count (1+ count)))
	  (message "buffer contains %s words." count))))

;; author: pluskid
;; 调用 stardict 的命令行接口来查辞典
;; 如果选中了 region 就查询 region 的内容，
;; 否则就查询当前光标所在的词
(global-set-key (kbd "C-c s d") 'kid-star-dict)
(defun kid-star-dict ()
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    ;; 有时候 stardict 会很慢，所以在回显区显示一点东西
    ;; 以免觉得 Emacs 在干什么其他奇怪的事情。
    (message "searching for %s ..." (buffer-substring begin end))
    (tooltip-show
     (shell-command-to-string
      (concat "sdcv -n "
              (buffer-substring begin end))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This file contains several examples of how to set up emacs and/or xemacs
;;; to edit PostgreSQL code.
;;;
;;; Whichever set you choose would go in your .emacs file or equivalent.
;;;
;;; You only need one of these.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This set is known to work with old versions of emacs

(setq auto-mode-alist
  (cons '("\\(postgres\\|pgsql\\).*\\.[ch]\\'" . pgsql-c-mode)
        auto-mode-alist))
(setq auto-mode-alist
  (cons '("\\(postgres\\|pgsql\\).*\\.cc\\'" . pgsql-c-mode)
        auto-mode-alist))

(defun pgsql-c-mode ()
  ;; sets up formatting for PostgreSQL C code
  (interactive)
  (c-mode)
  (setq-default tab-width 4)
  (c-set-style "bsd")             ; set c-basic-offset to 4, plus other stuff
  (c-set-offset 'case-label '+)   ; tweak case indent to match PG custom
  (setq indent-tabs-mode t))      ; make sure we keep tabs when indenting


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Similar approach, known to work with xemacs
;;; Use of a named style makes it easy to use the style elsewhere

(c-add-style "pgsql"
                      '("bsd"
                                 (indent-tabs-mode . t)
                                 (c-basic-offset   . 4)
                                 (tab-width . 4)
                                 (c-offsets-alist .
                                            ((case-label . +)))
                      )
                      nil ) ; t = set this mode, nil = don't

(defun pgsql-c-mode ()
  (c-mode)
  (c-set-style "pgsql")
)

(setq auto-mode-alist
  (cons '("\\(postgres\\|pgsql\\).*\\.[chyl]\\'" . pgsql-c-mode)
        auto-mode-alist))
(setq auto-mode-alist
  (cons '("\\(postgres\\|pgsql\\).*\\.cc\\'" . pgsql-c-mode)
        auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Slightly different approach - use a hook instead of a mode

(add-hook 'c-mode-hook
	  (function
	   (lambda nil 
	     (if (string-match "pgsql" buffer-file-name)
		 (progn
		   (c-set-style "bsd")
		   (setq c-basic-offset 4) 
		   (setq tab-width 4)
		   (c-set-offset 'case-label '+)
		   (setq indent-tabs-mode t)
		   )
	       ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; To work on the documentation, the following (or a variant, as above)
;;; can be helpful.

(defun pgsql-sgml-mode ()
  "SGML mode adjusted for PostgreSQL project"
  (interactive)
  (sgml-mode)

  (setq sgml-basic-offset 1)
)

(setq auto-mode-alist
  (cons '("\\(postgres\\|pgsql\\).*\\.sgml\\'" . pgsql-sgml-mode)
        auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 调用 stardict 的命令行程序 sdcv 来查辞典
;; 如果选中了 region 就查询 region 的内容，否则查询当前光标所在的单词
;; 查询结果在一个叫做 *sdcv* 的 buffer 里面显示出来，在这个 buffer 里面
;; 按 q 可以把这个 buffer 放到 buffer 列表末尾，按 d 可以查询单词
;;(global-set-key (kbd "C-c s d") 'kid-sdcv-to-buffer)
;;(defun kid-sdcv-to-buffer ()
;;  (interactive)
;;  (let ((word (if mark-active
;;                  (buffer-substring-no-properties (region-beginning) (region-end))
;;                  (current-word nil t))))
;;    (setq word (read-string (format "Search the dictionary for (default %s): " word)
;;                            nil nil word))
;;    (set-buffer (get-buffer-create "*sdcv*"))
;;    (buffer-disable-undo)
;;    (erase-buffer)
;;    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-n" word)))
;;      (set-process-sentinel
;;       process
;;       (lambda (process signal)
;;         (when (memq (process-status process) '(exit signal))
;;           (unless (string= (buffer-name) "*sdcv*")
;;             (setq kid-sdcv-window-configuration (current-window-configuration))
;;             (switch-to-buffer-other-window "*sdcv*")
;;             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
;;             (local-set-key (kbd "q") (lambda ()
;;                                        (interactive)
;;                                        (bury-buffer)
;;                                        (unless (null (cdr (window-list))) ; only one window
;;                                          (delete-window)))))
;;           (goto-char (point-min))))))))

;; javascript mode
;;(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
;;(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;; (add-to-list 'load-path "~/.cpanplus/5.12.4/build/Emacs-PDE-0.2.16/lisp/")

(load-file "/home/vinian/.emacs.d/cedet-1.0/common/cedet-graphviz.el")

(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))