## ナビエ-ストークス方程式
流体の運動を記述する2階非線型偏微分方程式

粘性率が一定の非圧縮性流れの場合

![\begin{align*}
\frac{\partial \boldsymbol{v}}{\partial t} + ( \boldsymbol{v} \cdot \nabla )\boldsymbol{v}
= - \frac{1}{\rho} + \nu \nabla^2\boldsymbol{v} + \boldsymbol{g}
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0A%5Cfrac%7B%5Cpartial+%5Cboldsymbol%7Bv%7D%7D%7B%5Cpartial+t%7D+%2B+%28+%5Cboldsymbol%7Bv%7D+%5Ccdot+%5Cnabla+%29%5Cboldsymbol%7Bv%7D%0A%3D+-+%5Cfrac%7B1%7D%7B%5Crho%7D+%5Cnabla%5Cp+%2B+%5Cnu+%5Cnabla%5E2%5Cboldsymbol%7Bv%7D+%2B+%5Cboldsymbol%7Bg%7D%0A%5Cend%7Balign%2A%7D%0A)

- p   : 圧力
- v   : 流速
- rho : 密度 const
- nu  : 動粘性率 = 剪断粘性率 / 密度
- g   : 外力場、加速度場

<!-- 質量保存則

![\begin{align*}
\nabla \cdot \boldsymbol{v} = 0
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0A%5Cnabla+%5Ccdot+%5Cboldsymbol%7Bv%7D+%3D+0%0A%5Cend%7Balign%2A%7D%0A) -->


## 格子ボルツマン法 Lattice Boltzmann Method(LBM)
D2Q9のモデルを採用

![\begin{align*}
f^{(0)}_a(t,\boldsymbol{r}) = w_a\rho[1-\frac{3}{2}(\boldsymbol{v}^2)+3(\boldsymbol{e}_a\cdot\boldsymbol{v})+\frac{9}{2}(\boldsymbol{v}_a\cdot\boldsymbol{v})^2]
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0Af%5E%7B%280%29%7D_a%28t%2C%5Cboldsymbol%7Br%7D%29+%3D+w_a%5Crho%5B1-%5Cfrac%7B3%7D%7B2%7D%28%5Cboldsymbol%7Bv%7D%5E2%29%2B3%28%5Cboldsymbol%7Be%7D_a%5Ccdot%5Cboldsymbol%7Bv%7D%29%2B%5Cfrac%7B9%7D%7B2%7D%28%5Cboldsymbol%7Bv%7D_a%5Ccdot%5Cboldsymbol%7Bv%7D%29%5E2%5D%0A%5Cend%7Balign%2A%7D%0A)

![\begin{align*}
\boldsymbol{u} = \sum_{a}^{}\frac{c\boldsymbol{e}_af_a}{\rho} \ \ \ \ \ \
\because c = \frac{\Delta \boldsymbol{r}}{\Delta t}			
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0A%5Cboldsymbol%7Bu%7D+%3D+%5Csum_%7Ba%7D%5E%7B%7D%5Cfrac%7Bc%5Cboldsymbol%7Be%7D_af_a%7D%7B%5Crho%7D+%5C+%5C+%5C+%5C+%5C+%5C%0A%5Cbecause+c+%3D+%5Cfrac%7B%5CDelta+%5Cboldsymbol%7Br%7D%7D%7B%5CDelta+t%7D%09%09%09%0A%5Cend%7Balign%2A%7D%0A)


## 参考サイト
- [プログラム自動生成とCUDAによる格子ボルツマン法を利用した流体シミュレータの高速化](http://www.net.c.dendai.ac.jp/~goto/)