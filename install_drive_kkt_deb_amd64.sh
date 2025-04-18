#!/bin/bash

# Проверка параметра
if [ -z "$1" ]; then
	echo "Ошибка: неуказан параметр"
	exit 1
fi

sudo apt update

unzip $1 $pwd

# Переменая-обрез строки
short_name=${1%%.zip}

# Установка пакетов

sudo dpkg -i $short_name/installer/deb/libfptr10-gui_"$short_name"_amd64.deb
sudo dpkg -i $short_name/installer/deb/libfptr10_"$short_name"_amd64.deb
sudo dpkg -i $short_name/installer/deb/fptr10-test-util_"$short_name"_amd64.deb

# Функция удаление установочных файлов
func_delete_old_file()
{
        echo "Удаление файла $1"
	sleep 2
        sudo rm -rf $1
        echo "Файл: $1 удален."
}

func_delete_old_file "$1"
func_delete_old_file "$short_name"

`fptr10_t`
