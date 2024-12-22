#!/bin/bash

file="urls.txt"

while IFS=" " read -r url path; do
    echo "İndirilen URL: $url"
    echo "Kaydedilecek dosya: $path"

    # Hedef dizini kontrol et, yoksa oluştur
    dir=$(dirname "$path")
    if [[ ! -d "$dir" ]]; then
        mkdir -p "$dir"
    fi

    # URL'yi indir
    curl -L -o "$path" "$url"

    # İndirme kontrolü
    if [[ $? -eq 0 ]]; then
        echo "Başarıyla indirildi: $path"
    else
        echo "İndirme başarısız oldu: $url"
    fi
done < "$file"
