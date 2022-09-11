# nvim 配置文件

# 使用方法

## 安装&配置

### 安装neovim

*MacOS*

```bash
brew install neovim
```

*Linux*

```bash
# Arch Linux
sudo pacman -S neovim

# CentOS
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum install -y neovim python3-neovim

# Debian / Ubuntu
sudo apt-get install neovim

# Fedora
sudo dnf install -y neovim python3-neovim
```

*Windows*

建议使用WSL或者Scoop

```bash
scoop install neovim
```

### 安装python支持

```bash
# pip
pip install neovim

# conda
conda install -c conda-forge neovim
```

### 安装vim-Plug插件

```bash
# Unix
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Windows(PowerShell)
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

### 克隆配置文件

```bash
cd ~/.config/
git clone git@github.com:NAkeshu/nvim.git

cd nvim
nvim init.vim
```

在init.vim文件内执行

```vimscript
:PlugInstall
```

插件安装好后再退出、启动几次neovim即可。

## 自定义快捷键列表 Customized & Remaned Keys list

| 快捷键               | 功能                                               |
|----------------------|----------------------------------------------------|
| `<space>`            | `<LEADER>`键                                       |
| `<C-j>`              | 向下移动五行                                       |
| `<C-k>`              | 向上移动五行                                       |
| `<C-e>`              | 插入模式下光标移动到行尾(与markdown table插件冲突) |
| `<C-a>`              | 插入模式下光标移动到行首(与markdown table插件冲突) |
| `<C-n>`              | 插入模式下光标移动到下一行                         |
| `<C-p>`              | 插入模式下光标移动到上一行                         |
| `z + m`              | 折叠代码块                                         |
| `z + M`              | 折叠所有层级代码块                                 |
| `z + r`              | 展开代码块                                         |
| `z + R`              | 展开所有层级代码块                                 |
| `<C-m>`(insert mode) | 设置占位符                                         |
| `<C-f>`              | 跳转到占位符                                       |
| `W`                  | 保存（相当于`:w`）                                 |
| `Q`                  | 退出（相当于`:q`)                                  |
| `R`                  | 重做                                               |
| `<LEADER> <CR>`      | 取消搜索结果高亮（相当于`:nohlsearch`）            |

### 窗口相关

| 快捷键               | 功能                    |
|----------------------|-------------------------|
| `<C-t> n`      | 打开新标签页            |
| `<C-t> j k`        | 切换到前/后标签页       |
| `<C-t> h l`        | 切换到最前/后标签页     |
| `<C-t> [ ]`        | 切换到前/后缓冲区       |
| `<C-t> q`          | 关闭当前缓冲区          |

### 插件

#### NerdTree

| 快捷键      | 功能              |
|-------------|-------------------|
| `<t> + <t>` | 打开/关闭NerdTree |

#### TagbarToggle

| 快捷键           | 功能            |
|------------------|-----------------|
| `<LEADER> + <b>` | 打开/关闭Tagbar |


#### UndoTreeToggle

| 快捷键           | 功能              |
|------------------|-------------------|
| `<LEADER> + <u>` | 打开/关闭UndoTree |

#### Markdown Preview

| 快捷键             | 功能             |
|--------------------|------------------|
| `<LEADER> + m + p` | 打开markdown预览 |

#### Table Mod

| 快捷键             | 功能          |
|--------------------|---------------|
| `<LEADER> + m + t` | 启用Table Mod |

#### Vim Terminal help

| 快捷键           | 功能                             |
|------------------|----------------------------------|
| `<meta-=>`       | 打开内置终端                     |
| `<meta-H J K L>` | 终端和编辑器之间上下左右页面切换 |
| `<meta-q>`       | 进入终端Normal Mode              |

#### Vim-sandwich & Wildfire

| 快捷键                                      | 功能                                                            |
|---------------------------------------------|-----------------------------------------------------------------|
| `<CR>`(normal mode / visual mode)           | 选中代码块/选中上层代码块                                       |
| `<BS>`(visual mode)                         | 选中内层代码块                                                  |
| `S + ' " { ] <q> ...`                       | 在选中的代码块外添加'\/"\/{\/]\/<q>\/...                        |
| `c + s + ' " { ] <q> ... + ' " { ] <q> ...` | 把包裹选中的代码块的'\/"\/{\/]\/<q>\/...换成'\/"/{\/]\/<q>\/... |
| `d + s + ' " { ] <q> ...`                   | 删除选中的代码块中的'\/"\/{\/]\/<q>\/...                        |

#### Coc.nvim

| 快捷键            | 功能                 |
|-------------------|----------------------|
| `<TAB> / <C-n>`   | 选择下一个提示选项   |
| `<C-p>`           | 选择上一个提示选项   |
| `<C-o>`           | 显示提示             |
| `<C-k> / <CR>`    | 选择补全             |
| `<C-w>`           | 跳转到下一个补全位置 |
| `<C-q>`           | 跳转到上一个补全位置 |
| `<LEADER> + r +n` | 重命名               |
| `<LEADER> + ?`    | 显示文档             |
| `<LEADER> + a`    | 显示可以使用的活动   |
| `<LEADER> + e`    | 显示/关闭explorer    |
| `g + [`           | 跳转到前一个报错     |
| `g + ]`           | 跳转到后一个报错     |
| `g + d`           | 跳转到定义           |
| `g + y`           | 跳转到类型定义       |
| `g + i`           | 跳转到实现           |
| `g + r`           | 跳转到引用           |

