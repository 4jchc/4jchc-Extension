# 4jchc-Extension
自己搜集的一些常用的扩展延伸 Xcode7.2.swift2.11 

   git config --global user.name “4jchc"
   
   git config --global user.email  "jiangjin5y24@163.com"
   
之前没有贡献GitHub的记录是因为本地的邮箱带了""号所以没有贡献值更改为不带双引号的名字和邮箱
  
   git config --global user.name 4jchc
   
   git config --global user.email  jiangjin5y24@163.com


2.更改历史信息   改回自己以前以加了""时提交的代码信息



1. 克隆要修改的项目地址 

git clone --bare  克隆要修改的项目地址 

2.进入项目目录

cd 项目目录

3.修改项目的emal 应该是”你的邮箱” 改为 你的邮箱 不带双引号

#!/bin/sh

git filter-branch --env-filter '

OLD_EMAIL=“你的邮箱”

CORRECT_NAME=你的名字

CORRECT_EMAIL=你的邮箱

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]

then

export GIT_COMMITTER_NAME="$CORRECT_NAME"

export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"

fi

if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]

then

export GIT_AUTHOR_NAME="$CORRECT_NAME"

export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"

fi

' --tag-name-filter cat -- --branches --tags

4.复制代码 在终端回车



5. 直接复制代码回车就行

git push --force --tags origin 'refs/heads/*'

6.回到上个目录

cd ..

7.执行删除命令当然也可以手动删除

rm -rf repo.git

这样你的提交者就改为自己了 这是本人的错误所在.仅供参考
