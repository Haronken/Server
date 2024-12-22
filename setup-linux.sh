#!/bin/bash

file="urls.txt"

while IFS=" " read -r url path; do
    echo "İndirilen URL: $url"
    echo "Kaydedilecek dosya: $path"

    curl -L -o "$path" "$url"

    if [[ $? -eq 0 ]]; then
        echo "Başarıyla indirildi: $path"
    else
        echo "İndirme başarısız oldu: $url"
    fi
done < "$file"
