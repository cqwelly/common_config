#!/usr/bin/env sh
conf=pdfview.conf
app=`grep ^app $conf | awk -F'=' '{print $2}'`
version=`grep ^version $conf | awk -F'=' '{print $2}'`

mkdir -p pdf
mkdir -p var
mkdir -p log

wget download.df.cn/pdfview/${version}.tar.gz 
tar -zxvf ${version}.tar.gz
mv -f $version/* .
rm -rf ${version}*

cur_path=`pwd`
new_path="#!${cur_path}/venv/bin/python"
echo $new_path
sed -i "1c\\$new_path" venv/bin/gunicorn 
sed -i "1c\\$new_path" venv/bin/pip

tar -zcf build.tar.gz * .[!.]*
