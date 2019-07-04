# 2019/0704 氷みたいなシェーダーを作成する(リムライティングという技術と同じらしい)

## before
![before](./image/before.png "サンプル")

## after
![after](./image/after.png "サンプル")

## シェーダー

[black.shader](../../ice.shader)

## やったこと

本線ベクトルとビューベクトルから内側は透明, 外側は反射が起こるように値を調整した