;;; ### Unset key ###
;;; --- 卸载按键
(lazy-unset-key                         ;全局按键的卸载
 '("C-x C-f" "C-z" "C-q" "s-W" "s-z" "M-h" "C-x C-c" "C-\\" "s-c" "s-x" "s-v" "M-z"))
;;; ### Sdcv ###
;;; --- 星际译王命令行
(defvar sdcv-key-alist nil
  "The key alist that sdcv.")
(setq sdcv-key-alist
      '(("p" . sdcv-search-pointer)     ;光标处的单词, buffer显示
        ("y" . sdcv-search-pointer+)    ;光标处的单词, tooltip显示
        ("i" . sdcv-search-input)       ;输入的单词, buffer显示
        (";" . sdcv-search-input+)))    ;输入的单词, tooltip显示
(lazy-set-prefix-autoload-key sdcv-key-alist nil "C-z" "init-sdcv")
;;; ### Insert translated name ###
(defvar insert-translated-name-key-alist nil
  "The key alist that insert-translated-name.")
(setq insert-translated-name-key-alist
      '(
        ("," . insert-translated-name-insert-with-underline)
        ("." . insert-translated-name-insert-with-camel)
        ))
(lazy-set-prefix-autoload-key insert-translated-name-key-alist nil "C-z" "init-insert-translated-name")
(lazy-set-autoload-key
 '(
   ("C-M-z i" . insert-translated-name-insert)
   )
 "init-insert-translated-name")
;; Dash.
(defvar dash-key-alist nil
  "The key alist that dash.")
(setq dash-key-alist
      '(("y" . dash-at-point)
        ))                              ;输入的单词, tooltip显示
(lazy-set-prefix-autoload-key dash-key-alist nil "C-x" "dash-at-point")
;;; ### Toolkit ###
;;; --- 工具函数
(lazy-set-key
 '(
   ("C-c ns" . notes-search)                ;便签搜索
   ("C-c nn" . notes-new)                   ;新建便签
   ("C-M-z c h" . ff-find-other-file)           ;打开头文件或者实现文件
   ("C-M-z c o" . one-key-menu-directory)       ;目录打开菜单
   ("C-M-z ," . bury-buffer)                    ;隐藏当前buffer
   ("C-M-z ." . unbury-buffer)                  ;反隐藏当前buffer
   ("C-M-z &" . killall)                        ;杀掉进程
   ("C-x w" . count-words)                  ;计算单词的数量
   ("C-x f" . find-file-at-point)           ;文件跳转
   ("C-M-z f" . find-file-root)                 ;用root打开文件
   ("C-M-z r" . find-file-smb)                  ;访问sambao
   ("<print>" . save-screenshots)           ;截屏
   ("<M-s-return>" . toggle-debug-on-error) ;切换调试模式
   ("C-M-z 1" . sort-lines)                     ;排序
   ("C-M-z 2" . hanconvert-region)              ;转换简体或繁体中文
   ("C-M-z 3" . uniquify-all-lines-buffer)      ;删除重复的行
   ("C-M-z 4" . elisp-depend-insert-comment)    ;插入 `...' 注释代码
   ("C-M-z 5" . elisp-depend-insert-require)    ;插入 (require '...) 语句
   ("C-M-z [" . eval-expression)                ;执行表达式
   ("C-M-z \\" . artist-mode)                   ;绘制模式
   ("C-s-q" . quoted-insert)                ;读取系一个输入字符并插入
   ("M-h" . set-mark-command) ;Instead C-Space for Chinese input method
   ("M-H" . set-mark-command) ;Instead C-Space for Chinese input method
   ("M-u" . upcase-char)      ;Upcase char handly with capitalize-word
   ("M-U" . upcase-word)      ;Upcase char handly with capitalize-word
   ("C-M-z p" . insert-standard-date)
   ))
(lazy-set-autoload-key
 '(
   ("C-M-z *" . one-key-menu-backup-file)   ;备份资料
   )
 "init-shell-command")
(lazy-set-autoload-key
 '(
   ("C-M-z R" . re-builder)                 ;可视化构建正则表达式
   )
 "init-rebuilder")
(lazy-set-autoload-key                  ;快速运行
 '(
   ("M-!" . quickrun))
 "quickrun")
;;; ### Color-Rg ###
;;; --- 搜索重构
(lazy-set-autoload-key
 '(
   ("C-M-z x g" . color-rg-search-symbol)   ;递归搜索当前目录下的文件
   ("C-M-z x h" . color-rg-search-input)    ;手动递归搜索当前目录下的文件
   )
 "color-rg")
(lazy-set-autoload-key
 '(
   ("C-z l" . display-line-numbers-mode) ;行号模式切换
   ("M-g" . goto-line-with-feedback)     ;可视化条转行
   )
 "basic-toolkit")
;;; ### Watch other window ###
;;; --- 滚动其他窗口
(lazy-set-autoload-key
 '(
   ("M-J" . watch-other-window-up)        ;向下滚动其他窗口
   ("M-K" . watch-other-window-down)      ;向上滚动其他窗口
   ("M-<" . watch-other-window-up-line)   ;向下滚动其他窗口一行
   ("M->" . watch-other-window-down-line) ;向上滚动其他窗口一行
   )
 "watch-other-window")
;;; ### Buffer Move ###
;;; --- 缓存移动
(lazy-set-key
 '(
   ("C-M-z J" . scroll-up-one-line)         ;向上滚动一行
   ("C-M-z K" . scroll-down-one-line)       ;向下滚动一行
   ("C-o" . open-newline-above)         ;在上面一行新建一行
   ("C-l" . open-newline-below)         ;在下面一行新建一行
   ("C-z k" . beginning-of-buffer)      ;缓存开始
   ("C-z j" . end-of-buffer)            ;缓存结尾
   ("M-p" . go-to-next-pair-right) ;在( ),' ', " ", [ ], { }中跳到匹配符号的右边
   ("M-n" . go-to-next-pair-left) ;在( ), ' ', " ", [ ], { }中跳到匹配符号的左边
   ("C-M-z g" . goto-percent)    ;跳转到当前Buffer的文本百分比, 单位为字符
   ("M-G" . goto-column)     ;到指定列
   ("C-M-f" . forward-paragraph)        ;下一个段落
   ("C-M-b" . backward-paragraph)       ;上一个段落
   ("C-M-y" . backward-up-list)         ;向左跳出 LIST
   ("C-M-o" . up-list)                  ;向右跳出 LIST
   ("C-M-u" . backward-down-list)       ;向左跳进 LIST
   ("C-M-i" . down-list)                ;向右跳进 LIST
   ("C-M-a" . beginning-of-defun)       ;函数开头
   ("C-M-e" . end-of-defun)             ;函数末尾
   ("C->" . remember-init)              ;记忆初始函数
   ("C-<" . remember-jump)              ;记忆跳转函数
   ("M-z ," . point-stack-pop)          ;buffer索引跳转
   ("M-z ." . point-stack-push)         ;buffer索引标记
   ("C-M-z {" . current-line-move-to-top)   ;移动当前行到最上面一行
   ))
(lazy-set-autoload-key
 '(
   ("%" . paredit-match-paren) ;当在括号上按 % 时, 自动跳转到与当前括号匹配的另一个括号
   )
 "paredit-extension")
(lazy-set-autoload-key
 '(
   ("M-s" . lazy-search-menu)           ;懒惰搜索
   )
 "lazy-search-extension")
(lazy-set-autoload-key
 '(
   ("C-M-z N" . move-text-down)      ;把光标所在的整行文字(或标记)下移一行
   ("C-M-z P" . move-text-up)        ;把光标所在的整行文字(或标记)上移一行
   )
 "move-text")
;;; ### Buffer Name ###
;;; --- 缓存名字
(lazy-set-autoload-key
 '(
   ("C-M-z c r" . rename-file-and-buffer)        ;更改当前文件的名字
   ("C-M-z c g" . move-buffer-file)              ;更改当前文件的目录
   ("C-M-z c n" . copy-buffer-file-name-as-kill) ;拷贝buffer名字
   ("C-M-;" . kill-other-window-buffer)      ;关闭其他窗口的buffer
   )
 "buffer-extension")
;;; ### Buffer Edit ###
;;; --- 缓存编辑
(lazy-set-key
 '(
   ("M-N" . kill-syntax-backward+)         ;向后进行语法删除
   ("M-M" . kill-syntax-forward+)          ;向前进行语法删除
   ("C-:" . comment-or-uncomment-region+)  ;注释当前行
   ("C-z n" . comment-dwim-next-line)      ;移动到上一行并注释
   ("C-z p" . comment-dwim-prev-line)      ;移动到下一行并注释
   ("M-z n" . comment-part-move-down)      ;向下移动注释
   ("M-z p" . comment-part-move-up)        ;向上移动注释
   ("C-x C-x" . exchange-point-and-mark)   ;交换当前点和标记点
   ("M-o" . backward-delete-char-untabify) ;向前删除字符
   ;; ("M-z" . zap-to-char)                      ;向前删除到第一个相符的字符
   ;; ("C-M-z" . zap-back-to-char)               ;向后删除到第一个相符的字符
   ("C-/" . undo)                             ;撤销
   ("C-?" . redo)                             ;重做
   ("C-M-z k" . kill-and-join-forward)            ;在缩进的行之间删除
   ("C-x u" . mark-line)                      ;选中整行
   ("C-M-S-h" . mark-paragraph)               ;选中段落
   ("C-z o" . duplicate-line-or-region-above) ;向上复制当前行或区域
   ("C-z l" . duplicate-line-or-region-below) ;向下复制当前行或区域
   ("C-S-s-o" . duplicate-line-above-comment) ;复制当前行到上一行, 并注释当前行
   ("C-S-s-l" . duplicate-line-below-comment) ;复制当前行到下一行, 并注释当前行
   ("M-SPC" . just-one-space)                 ;只有一个空格在光标处
   ))
;;; ### Rect ###
;;; --- 矩形操作
(lazy-set-autoload-key
 '(
   ("C-M-z M" . rm-set-mark)                ;矩形标记
   ("C-M-z X" . rm-exchange-point-and-mark) ;矩形对角交换
   ("C-M-z D" . rm-kill-region)             ;矩形删除 ("s-S" . rm-kill-ring-save)          ;矩形保存
   ("C-M-z Y" . yank-rectangle)             ;粘帖矩形
   ("C-M-z O" . open-rectangle)            ;用空白填充矩形, 并向右移动文本
   ("C-M-z C" . clear-rectangle)           ;清空矩形
   ("C-M-z T" . string-rectangle)          ;用字符串替代矩形的每一行
   ("C-M-z I" . string-insert-rectangle)   ;插入字符串在矩形的每一行
   ("C-M-z F" . delete-whitespace-rectangle) ;删除矩形中空格
   ("C-M-z \"" . copy-rectangle-to-register) ;拷贝矩形到寄存器
   ("C-M-z :" . mark-rectangle-to-end)       ;标记矩形到行末
   )
 "rect-extension")
;;; ### Font ###
;;; --- 字体命令
(lazy-set-key
 '(
   ("C-M-z -" . text-scale-decrease)        ;减小字体大小
   ("C-M-z =" . text-scale-increase)        ;增加字体大小
   ("M--" . text-scale-decrease-global) ;减少字体大小, 全局
   ("M-+" . text-scale-increase-global) ;增加字体大小, 全局
   ("M-=" . text-scale-default-global)  ;恢复字体大小, 全局
   ))
;;; ### Window Operation ###
;;; --- 窗口操作
(lazy-set-key
 '(
   ("C-c v" . split-window-vertically)   ;纵向分割窗口
   ("C-c h" . split-window-horizontally) ;横向分割窗口
   ("C-;" . kill-this-buffer)            ;关闭当前buffer
   ("C-x ;" . delete-other-windows)      ;关闭其它窗口
   ))
;;; ### Multi-Scratch
(lazy-set-autoload-key
 '(
   ("C-M-z Q" . multi-scratch-new)
   ("C-S-s-q" . multi-scratch-new)
   )
 "multi-scratch")
(lazy-set-autoload-key
 '(
   ("C-M-z ;" . one-key-menu-window-navigation) ;快速窗口导航
   )
 "init-window")
(lazy-set-autoload-key
 '(
   ("C-c V" . delete-other-windows-vertically+)   ;关闭上下的其他窗口
   ("C-c H" . delete-other-windows-horizontally+) ;关闭左右的其他窗口
   ("C-'" . delete-current-buffer-and-window) ;关闭当前buffer, 并关闭窗口
   ("C-\"" . delete-current-buffer-window)    ;删除当前buffer的窗口
   ("C-z 7" . select-next-window)             ;选择下一个窗口
   ("C-z 8" . select-prev-window)             ;选择上一个窗口
   ("M-z o" . toggle-one-window)              ;切换一个窗口
   ("C-x O" . toggle-window-split)
   )
 "window-extension")
;; (lazy-set-autoload-key
;;  '(
;;    ("C-x o" . ace-window))
;;  "ace-window")
;;; ### Awesome-Tab ###
;;; --- 多标签浏览
(lazy-set-key
 '(
   ("M-7" . awesome-tab-backward-tab)              ;移动到后一个标签
   ("M-8" . awesome-tab-forward-tab)               ;移动到前一个标签
   ("M-9" . awesome-tab-backward-group)            ;移动到后一个标签组
   ("M-0" . awesome-tab-forward-group)             ;移动到前一个标签组
   ("<C-tab>" . awesome-tab-backward-tab)          ;移动到后一个标签
   ("<C-S-iso-lefttab>" . awesome-tab-forward-tab) ;移动到前一个标签
   ))
(lazy-set-autoload-key
 '(
   ("M-&" . awesome-tab-backward-tab-other-window)
   ("M-*" . awesome-tab-forward-tab-other-window)
   ("M-z 7" . awesome-tab-select-beg-tab)
   ("M-z 8" . awesome-tab-select-end-tab)
   ("C-M-z a" . awesome-tab-kill-other-buffers-in-current-group)
   ("C-M-z A" . awesome-tab-kill-all-buffers-in-current-group)
   ("C-M-z w" . awesome-tab-keep-match-buffers-in-current-group)
   ("C-M-Z W" . awesome-tab-kill-match-buffers-in-current-group)
   )
 "awesome-tab-extension")
;;; ### Functin key ###
;;; --- 功能函数
(lazy-set-key
 '(
   ("<f1>" . sh-show-help)              ;elisp help
   ("<f2>" . refresh-file)              ;自动刷新文件
   ("<f3>" . visit-tags-table)          ;查找TAGS文件 (更新TAGS表)
   ("<f4>" . generate-gtags-files)      ;生成gtags引用文件
   ("<f5>" . emacs-session-save)        ;退出emacs
   ("C-x C-c" . emacs-session-save)     ;退出emacs
   ("<f6>" . lock-screen)               ;锁屏
   ("<f8>" . dired-jump)                ;文件管理起
   ("<f9>" . list-load-path-shadows)    ;显示重复加载的库
   ("<f10>" . open-current-log-keyboard-command) ;打开命令日志
   ("<f12>" . hibernate-disk)                    ;休眠
   ("M-1" . strip-blank-lines)          ;删除选中区域的所有空行
   ("M-2" . indent-buffer)              ;自动格式化当前Buffer
   ("M-3" . delete-trailing-whitespace) ;删除行末空格
   ("M-4" . whitespace-cleanup)         ;清理空格
   ("M-5" . insert-line-number+)        ;自动在行首添加行号
   ("M-6" . strip-line-number)          ;删除选中区域的行号
   ("C-4" . insert-changelog-date)      ;插入日志时间 (%Y/%m/%d)
   ("C-5" . insert-standard-date)       ;插入标准时间 (%Y-%m-%d %T)
   ("C-&" . switch-to-messages)         ;跳转到 *Messages* buffer
   ("M-I" . backward-indent)            ;向后移动4个字符
   ))
(lazy-set-autoload-key
 '(
   ("C-z s" . swiper))
 "swiper")                              ;super regex search
(lazy-set-autoload-key
 '(
   ("<f11>" . fullscreen-toggle)        ;全屏切换
   )
 "fullscreen")
(lazy-set-autoload-key
 '(
   ("<f7>" . one-key-menu-ui)           ;用户界面菜单
   )
 "init-one-key")
(lazy-set-autoload-key
 '(
   ("C-7" . find-define-back)           ;返回查找符号的定义之前的位置
   ("C-8" . find-define-go)             ;查找符号的定义
   ("C-9" . find-define-prompt)         ;手动输入查询的定义
   )
 "find-define")
;;; ### Paredit ###
;;; --- 结构化编程
(lazy-unset-key
 '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")
 paredit-mode-map)                      ;卸载按键
(defvar paredit-key-alist nil)
(setq paredit-key-alist
      '(
        ;; 符号插入
        ("(" . paredit-open-parenthesis)       ;智能 (
        (")" . paredit-close-parenthesis)      ;智能 )
        ("[" . paredit-open-bracket)           ;智能 [
        ("]" . paredit-close-bracket)          ;智能 ]
        ("{" . paredit-open-curly-smart)       ;智能 {
        ("}" . paredit-close-curly)            ;智能 }
        ("C-s-," . paredit-open-angled)        ;智能 <
        ("C-s-." . paredit-close-angled)       ;智能 >
        ("\"" . paredit-doublequote)           ;智能 "
        ("\\" . paredit-backslash)             ;智能 \
        ;; 删除
        ("M-o" . paredit-backward-delete)      ;向后删除
        ("C-d" . paredit-forward-delete)       ;向前删除
        ("C-M-m" . paredit-forward-kill-word)  ;向前按词删除
        ("C-M-n" . paredit-backward-kill-word) ;向后按词删除
        ;; 移动
        ("C-M-S-m" . paredit-forward)       ;向前移动
        ("C-M-S-n" . paredit-backward)      ;向后移动
        ;; 包围
        ("M-\"" . paredit-meta-doublequote) ;用 " " 包围对象, 或跳出字符串
        ("M-[" . paredit-wrap-square)       ;用 [ ] 包围对象
        ("M-{" . paredit-wrap-curly)        ;用 { } 包围对象
        ("C-(" . paredit-wrap-angled)       ;用 < > 包围对象
        ;; 跳出并换行缩进
        ("M-}" . paredit-close-curly-and-newline)  ;跳出 { } 并换行
        ("M-]" . paredit-close-square-and-newline) ;跳出 [ ] 并换行
        ("C-)" . paredit-close-angled-and-newline) ;跳出 < > 并换行
        ;; 其他
        ("C-j" . paredit-newline)        ;智能换行并缩进
        ("M-q" . paredit-reindent-defun) ;重新格式化函数
        ("M-s-r" . paredit-raise-sexp) ;提取表达式, 并删除同一等级的其他表达式
        ("M-s-b" . paredit-convolute-sexp) ;嵌套表达式
        ("M-s-'" . one-key-menu-paredit)   ;Paredit 菜单
        ))
(lazy-set-key paredit-key-alist paredit-mode-map)
(lazy-set-mode-autoload-key
 '(
   ("C-k" . paredit-kill+))             ;增强的 paredit-kill
 paredit-mode-map nil "paredit-extension")
(lazy-set-autoload-key
 '(
   ("C-M-:" . paredit-comment-list-and-newline) ;注释当前LIST并换行
   ("M-:" . paredit-close-round-and-newline+) ;跳出 ( ) 或 " " 并换行
   ("M-?" . paredit-forward-sexp-and-newline) ;移动到下一个表达式, 并换行
   ("M-(" . paredit-wrap-sexp)                ;用 ( ) 包围当前对象
   ("M-)" . paredit-splice-sexp+)      ;去除包围对象的括号, 并删除空行
   ("C-S-k" . paredit-duplicate-closest-sexp) ;复制光标处的语法块
   )
 "paredit-extension")
;;; ### Ruby-Extension ###
;;; --- Ruby useful functions.
;(lazy-set-mode-autoload-key
; '(
;   ("C-c t" . ruby-hash-syntax-toggle))
; ruby-mode-map nil "ruby-extension")
;;; ### Thingh-edit ###
;;; --- 增强式编辑当前光标的对象
(lazy-set-autoload-key
 '(
   ("M-z h" . one-key-menu-thing-edit)  ;thing-edit 菜单
   )
 "init-thing-edit"
 )
;;; ### Aweshell ###
;;; --- 多标签式的shell
(lazy-set-autoload-key
 '(
   ("C-M-z n" . aweshell-new)
   ("C-M-z h" . aweshell-toggle)
   )
 "aweshell")
;;; ### W3m ###
;;; --- 网页浏览器
(lazy-set-autoload-key
 '(
   ("C-z C-z" . w3m)                    ;启动W3M
   )
 "init-w3m")
(lazy-set-autoload-key
 '(
   ("C-z z" . w3m-startup-background)         ;启动W3M, 后台
   ("C-x C-z" . toggle-w3m-with-other-buffer) ;在W3M和buffer间切换
   )
 "w3m-extension")
;;; ### Dired ###
;;; --- Dired
(lazy-set-autoload-key
 '(
   ("<f8>" . dired-jump)
   ("C-x C-f" . find-file)
   )
 "init-dired")
;;; ### Helm ###
;;; --- 快速buffer切换
(lazy-set-autoload-key
 '(
   ("s-y" . helm-dwim)
   )
 "init-helm")
;;; ### EAF ###
;;; EAF
(unless (featurep 'cocoa)
  (lazy-set-autoload-key
   '(
     ("C-M-z '" . eaf-open)
     ("C-M-z /" . eaf-stop-process)
     )
   "init-eaf")
  (lazy-set-mode-autoload-key
   '(
     ("K" . eaf-dired-open-file)
     )
   dired-mode-map
   nil
   "init-eaf"))
;; Cycle buffer
(lazy-set-autoload-key
 '(
   ("M-C" . one-key-menu-cycle-buffer)  ;特定模式切换
   )
 "init-cycle-buffer")
;;; ### Isearch ###
;;; --- 交互式搜索
(lazy-set-key
 '(
   ("TAB" . isearch-complete)           ;isearch补全
   ("C-s" . isearch-repeat-forward) ;重复向前搜索, 第一次可以用来搜索上一次的历史哟
   ("C-r" . isearch-repeat-backward)   ;重复向后搜索
   ("C-g" . isearch-abort)             ;中止搜索
   ("C-w" . isearch-yank-word-or-char) ;粘帖光标后的词或字符作为搜索对象
   ("C-y" . isearch-yank-line)         ;粘帖光标后的行作为搜索对象
   ("M-o" . isearch-delete-char)       ;删除
   ("M-p" . isearch-ring-retreat)      ;搜索历史向后
   ("M-n" . isearch-ring-adjust)       ;搜索历史向前
   ("M-y" . isearch-yank-kill) ;从 kill ring 中粘帖最后一项到搜索对象后
   ("M-h" . isearch-yank-char) ;粘帖光标后的字符到搜索对象
   ("M-e" . isearch-edit-string)        ;编辑搜索对象
   ("M-c" . isearch-toggle-case-fold)   ;切换大小写
   ("M-r" . isearch-toggle-regexp)      ;切换正则表达式
   ("M-w" . isearch-toggle-word)        ;切换词
   ("M->" . isearch-beginning-of-buffer) ;跳转到buffer开头并重新搜索, 搜索最前面一个
   ("M-<" . isearch-end-of-buffer) ;跳转到buffer末尾并重新搜索, 搜索最后面一个
   ("M-%" . isearch-query-replace) ;替换
   ("M-d" . isearch-find-duplicate-word)    ;查找重复的单词
   ("M-z" . isearch-find-duplicate-line)    ;查找重复的行
   ("C-M-%" . isearch-query-replace-regexp) ;正则表达式替换
   )
 isearch-mode-map
 )
(lazy-set-autoload-key
 '(
   ("M-L" . isearch-to-lazy-search)     ;切换到lazy-search
   )
 "lazy-search-extension")
;; ### Helm Packman ###
;;; --- Pacman 管理工具
(lazy-set-autoload-key
 '(
   ("C-M-z x z" . helm-system-packages)
   )
 "helm-system-packages-pacman")
;;; ### Flycheck ###
;;; --- 及时拼写检查
(lazy-set-autoload-key
 '(
   ("M-s-j" . flycheck-next-error)      ;显示下一个错误
   ("M-s-k" . flycheck-previous-error)  ;显示上一个错误
   )
 "init-flycheck"
 )
;;; ### kill-ring-search ###
;;; --- 删除环的递增式搜索
(lazy-set-autoload-key
 '(
   ("M-z y" . kill-ring-search)         ;kill ring 搜索
   )
 "init-kill-ring-search")
;;; ### Help ###
;;; --- 帮助模式
(lazy-set-autoload-key
 '(
   ("C-h". one-key-menu-help)           ;帮助菜单
   )
 "init-help-mode")
;;; ### IRC ###
;;; --- 聊天
(lazy-set-autoload-key
 '(
   ("M-U" . one-key-menu-irc-channel)   ;跳转到IRC频道
   )
 "init-irc")
;;; ### Yoaddmuse ###
;;; --- Yet another oddmuse mode
(lazy-set-autoload-key
 '(
   ("M-s-;" . one-key-menu-yaoddmuse)   ;yaoddmuse 菜单
   )
 "init-yaoddmuse")
;;; ### Festival ###
;;; --- 语音阅读
(lazy-set-autoload-key
 '(
   ("C-M-z x r" . one-key-menu-festival)    ;语音阅读菜单
   )
 "init-festival")
;;; ### Less ###
;;; --- 快速浏览模式
(lazy-set-autoload-key
 '(
   ("M-z l" . less-minor-mode)          ;打开less模式
   )
 "init-less")
;;; ### Speedbar ###
;;; --- 快速访问文件和tags
(lazy-set-autoload-key
 '(
   ("C-M-z zz" . sr-speedbar-toggle)        ;显示/隐藏speedbar
   ("C-M-z zx" . sr-speedbar-select-window) ;选中speedbar窗口
   )
 "init-speedbar")
;;; ### iedit ###
;;; --- iedit
(lazy-set-autoload-key
 '(
   ("C-M-z o" . iedit-mode)
   )
 "iedit")
;;; ### Ace jump ###
(lazy-set-autoload-key
 '(
   ("C-M-z <" . ace-jump-word-mode)
   ("C-M-z >" . ace-jump-char-mode)
   ("C-M-z ?" . ace-jump-line-mode)
   )
 "ace-jump-mode")
;;; ### Python ###
;;; --- Python mode
(eval-after-load 'python-mode
  '(lambda ()
     (lazy-set-mode-autoload-key
      '(
        ("C-z j" . jump-to-import)
        )
      python-mode-map nil "python-mode-utils")
     ))
;;; ### Ielm ###
;;; --- Emacs Lisp 解释模式
(autoload 'ielm-map "ielm")
(lazy-set-autoload-key
 '(
   ("M-z i" . ielm-toggle)              ;切换ielm
   ("C-M-z 6" . insert-standard-date)       ;插入标准时间
   ("C-M-z 7" . insert-changelog-date)      ;插入Changlog时间
   )
 "lazycat-toolkit")
(eval-after-load 'ielm-mode
  '(lambda ()
     (progn
       (lazy-unset-key
        '("M-p" "M-n")
        ielm-map)                       ;卸载按键
       (lazy-set-key
        '(
          ("C-z p" . comint-previous-input) ;上一个输入
          ("C-z n" . comint-next-input)     ;下一个输入
          )
        ielm-map
        )
       )))
;;; ### Man ###
;;; --- Man
(lazy-set-autoload-key
 '(
   ("C-<f1>" . woman))
 "init-woman")
;;; ### Company en words ###
;;; --- 英文助手
(lazy-set-autoload-key
 '(
   ("M-r" . toggle-company-english-helper) ;英文助手
   )
 "company-english-helper")
;;; ### Ispell ###
;;; --- 拼写检查
(lazy-set-autoload-key
 '(("C-M-z v s-v" . ispell-buffer))
 "init-ispell")                         ;检查当前buffer
;;; ### Ido ###
;;; --- 交互式管理文件和缓存
(lazy-set-key
 '(
   ("C-x C-f" . ido-find-file)          ;交互式查找文件
   ("C-x b" . ido-switch-buffer)        ;交互式切换buffer
   ("C-x i" . ido-insert-buffer)        ;插入缓存
   ("C-x I" . ido-insert-file)          ;插入文件
   ))
(add-hook 'ido-setup-hook
          '(lambda ()
             (interactive)
             (ido-my-keys ido-completion-map)))
(defun ido-my-keys (keymap)
  "Add my keybindings for ido."
  (lazy-set-key
   '(
     ("M-z p" . ido-prev-match)              ;上一个匹配
     ("M-z n" . ido-next-match)              ;下一个匹配
     ("M-z h" . ido-next-work-directory)     ;下一个工作目录
     ("M-z l" . ido-prev-work-directory)     ;上一个工作目录
     ("M-o" . backward-delete-char-untabify) ;向前删除字符
     ("M-O" . ido-delete-backward-updir)     ;删除字符或进入上一级目录
     )
   keymap
   ))
;;; ### IRC ###
;;; --- 聊天
(lazy-set-autoload-key
 '(
   ("C-c i" . switch-to-erc)            ;切换到IRC或自动登录IRC
   ("C-c I" . erc-nick-notify-jump-last-channel) ;自动跳转到最后收到消息的频道
   ("M-U" . one-key-menu-irc-channel)            ;跳转到IRC频道
   )
 "init-erc")
;;; Elisp
(lazy-set-key
 '(
   ("RET" . comment-indent-new-line)    ;自动换行并注释
   )
 emacs-lisp-mode-map
 )
;;; ### Wget ###
;;; --- 下载程序
(lazy-set-autoload-key
 '(
   ("C-M-z c dd" . wget-show)               ;显示下载信息
   ("C-M-z c dh" . wget-hide)               ;隐藏下载信息
   ("C-M-z c dq" . wget-quit-and-exit)      ;停止下载
   )
 "wget-extension")
;;; ### EMMS ###
;;; --- Emacs 多媒体系统
(lazy-set-autoload-key
 '(
   ("C-c p" . one-key-menu-emms)        ;播放器菜单
   ("<up>" . emms-volume-mode-plus)     ;增加音量
   ("<down>" . emms-volume-mode-minus)  ;减少音量
   ("<left>" . emms-seek-backward)      ;后退
   ("<right>" . emms-seek-forward)      ;前进
   ("M-A" . emms-pause)                 ;暂停/播放
   ("M-X" . emms-random)                ;随机播放
   ("M-Z" . emms-stop)                  ;停止
   )
 "init-emms")
;;; ### Org ###
;;; --- 笔记管理和组织
(lazy-set-autoload-key
 '(
   ("C-M-z s" . one-key-menu-org-file)      ;Org 文件
   ("C-c r" . org-remember)             ;Org-remeber
   )
 "init-org-mode")
;;; ### String Inflection ###
;; --- 单词语法风格快速转换
(lazy-set-autoload-key
 '(
   ("C-c C-u" . one-key-string-inflection)
   )
 "init-string-inflection")
;;; ### Projectile Rails ###
;; Rails 文件快速导航
(lazy-set-autoload-key
 '(
   ("C-M-z c p" . one-key-projectile-rails) ;projectile rails
   )
 "init-projectile-rails")
;;; ### Top ###
;;; --- 进程管理器
(lazy-set-autoload-key
 '(
   ("<s-f8>" . top)                     ;TOP
   )
 "init-top")
;;; ### Doc-view ###
;;; --- 文档阅读器
(lazy-set-autoload-key
 '(
   ("C-M-j" . pdf-view-scroll-up-or-next-page+) ;翻另一个窗口中图书的下一页
   ("C-M-k" . pdf-view-scroll-down-or-previous-page+) ;翻另一个窗口中图书的上一页
   )
 "init-pdf-tools")
;;; ### Keyboard Macro ###
;;; --- 键盘宏
(lazy-set-autoload-key
 '(
   ("M-z s" . kmacro-start-macro-or-insert-counter) ;开始键盘宏或插入
   ("M-z d" . kmacro-end-or-call-macro)             ;结束键盘宏或调用
   ("M-z c" . kmacro-delete-ring-head)              ;删除当前的键盘宏
   ("M-z w" . kmacro-cycle-ring-next)               ;下一个键盘宏
   ("M-z e" . kmacro-cycle-ring-previous)           ;上一个键盘宏
   ("M-z a" . kmacro-edit-macro)                    ;编辑键盘宏
   ("M-z v" . name-last-kbd-macro)                  ;命令当前键盘宏
   ("M-z f" . insert-kbd-macro)                     ;插入键盘宏
   ("M-z q" . apply-macro-to-region-lines) ;应用键盘宏到选择的区域
   )
 "macros+")
;;; ### auto-install ###
(lazy-set-autoload-key
 '(
   ("C-s-x" . auto-install-from-emacswiki))
 "init-auto-install")
;;; ### expand-region ###
(lazy-set-autoload-key
 '(
   ("C-=" . er/expand-region))
 "expand-region")
;; ### vdiff ###
(lazy-set-autoload-key
 '(
   ("M-s-u" . vdiff-buffers))
 "vdiff")
;;; ### Magit ###
;;
(lazy-set-autoload-key
 '(
   ("C-M-z x f" . one-key-menu-magit))
 "init-git")

;;; ### Magit ###
(lazy-set-autoload-key
 '(
   ("C-M-z x i" . one-key-menu-indium))
 "init-web-mode")

(lazy-set-autoload-key
 '(
   ("C-M-z m" . toggle-input-method))
 "init-pyim")

(provide 'init-key)