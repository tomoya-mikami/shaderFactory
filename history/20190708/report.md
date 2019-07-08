# 2019/0704 氷みたいなシェーダーを作成する(リムライティングという技術と同じらしい)

## before
![before](./image/rim_before.png "サンプル")

## after
![after](./image/rim_after.png "サンプル")

## シェーダー

[rim.shader](../../rim.shader)

## やったこと

氷の時と逆のことをする

本線ベクトルとビューベクトルから内側から外側にむけてEmission値が高くなるようにする