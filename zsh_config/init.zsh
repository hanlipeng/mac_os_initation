#!/bin/zsh

# 找到 init.zsh 脚本所在的目录, 作为我们配置的根目录
export ZSH_CUSTOM_DIR=${0:a:h}

# 定义加载顺序 (可以根据你的需要调整)
# 建议先加载环境变量和路径, 再加载别名和函数
typeset -a config_dirs
config_dirs=(
  "$ZSH_CUSTOM_DIR/settings"
  "$ZSH_CUSTOM_DIR/exports"
  "$ZSH_CUSTOM_DIR/lib"
  "$ZSH_CUSTOM_DIR/aliases"
  "$ZSH_CUSTOM_DIR/core" # Load framework functions
  "$ZSH_CUSTOM_DIR/functions" # Load user-defined functions
)

# Add our custom completions directory to the function path
fpath=($ZSH_CUSTOM_DIR/completions $fpath)

# Initialize the completion system
# These lines are often in .zshrc; adding them here for robustness
autoload -U compinit
compinit -i

# 循环加载所有 .zsh 文件
for dir in $config_dirs; do
  # 检查目录是否存在
  if [[ -d "$dir" ]]; then
    # 查找所有 .zsh 或 .sh 后缀的文件并加载
    for file in $(find "$dir" -name "*.zsh" -o -name "*.sh"); do
      # 确保文件可读
      if [[ -r "$file" ]]; then
        source "$file"
      fi
    done
  fi
done

# 清理, 避免污染环境
unset config_dirs
