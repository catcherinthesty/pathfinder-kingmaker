for item in `ls |grep png`; do
    composite -compose Dst_Over $item gray.png ./gray/gray_$item;
done;
