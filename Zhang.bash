#/data/data/com.termux/files/usr/bin/bash
export Zhang_bash_run=true
case $1 in
-v|-version|-V|-Version) echo "本脚本是 Zhang.bash 的5.0版本" ;;
--help|-h) echo "本脚本可以直接调用，这是最主要的用法。-v/-V/-version/-Version 显示版本号。" ;;
esac
while true; do
echo "这是 Zhang.bash，Version：5.0"
echo "[1] 文件管理"
echo "[2] Proot 专项"
echo "[3] 软件管理"
echo "[0] 退出"
echo "未来还会添加更多选项"
read -r -p "选择哪一个? " YYN
if ! [[ "$YYN" =~ ^[0-9]+$ ]]; then
    eval "$YYN"
    continue
fi
case $YYN in
0) break ;;
1) while true; do
echo "[1] 复制文件或目录"
echo "[2] 删除文件或目录"
echo "[3] 给 xxx 加执行权限"
echo "[0] 退出"
read -r -p "选择哪个? " XXX
if ! [[ "$XXX" =~ ^[0-9]+$ ]]; then
    eval "$XXX"
    continue
fi
case $XXX in
0) break ;;
1) read -r -p "请提供原路径" cp_a
read -r -p "请提供目标路径" cp_b
cp -a $cp_a $cp_b
;;
2) read -r -p "🆘警告🆘:文件删除请深思熟虑。 " rm_a
rm -rf $rm_a
;;
3) read -r -p "请提供要给执行权限文件的位置。 " chmod_a
chmod +x $chmod_a
;;
esac
done
;;
2) while true; do
echo "[1] 安装 Proot"
echo "[2] 安装 Proot Debian"
echo "[3] 启动 Proot Debian"
echo "[0] 退出"
read -r -p "选择哪一个? " Proot
if ! [[ "$Proot" =~ ^[0-9]+$ ]]; then
    eval "$Proot"
    continue
fi
case $Proot in
0) break ;;
1) pkg install proot-distro ;;
2) proot-distro install debian ;;
3) proot-distro login debian ;;
esac
done
;;
3) while true; do
echo "注意:本功能的深度依赖 Termux，非 Termux 用户不能用！"
echo "[1] 安装『新』软件"
echo "[2] 卸载软件"
echo "[3] 列出所有软件"
echo "[0] 退出"
read -r -p "选择哪一个? " PKG
if ! [[ "$PKG" =~ ^[0-9]+$ ]]; then
    eval "$PKG"
    continue
fi
case $PKG in
0) break ;;
1) read -r -p "请输入该软件包的准确包名 " install
pkg install $install
;;
2) read -r -p "请谨慎卸载软件 " remove
pkg remove $remove
;;
3) pkg list-installed ;;
esac
done
;;
esac
done
